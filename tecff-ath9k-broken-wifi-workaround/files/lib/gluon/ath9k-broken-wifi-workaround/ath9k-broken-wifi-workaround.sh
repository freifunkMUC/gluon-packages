#!/bin/sh
#
# this script tries to recover nodes that have problems with wifi connections
#

# check if node has wifi
if [ ! -L /sys/class/ieee80211/phy0/device/driver ] && [ ! -L /sys/class/ieee80211/phy1/device/driver ]; then
	echo "node has no wifi, aborting."
	exit
fi

# check if node uses ath9k wifi driver
if ! expr "$(readlink /sys/class/ieee80211/phy0/device/driver)" : ".*/ath9k" >/dev/null; then
	if ! expr "$(readlink /sys/class/ieee80211/phy1/device/driver)" : ".*/ath9k" >/dev/null; then
		echo "node doesn't use the ath9k wifi driver, aborting."
		exit
	fi
fi

# don't do anything while an autoupdater process is running
pgrep autoupdater >/dev/null
if [ "$?" == "0" ]; then
	echo "autoupdater is running, aborting."
	exit
fi

MESHFILE="/tmp/wifi-mesh-connection-active"
CLIENTFILE="/tmp/wifi-ff-client-connection-active"
PRIVCLIENTFILE="/tmp/wifi-priv-client-connection-active"
GWFILE="/tmp/gateway-connection-active"
RESTARTFILE="/tmp/wifi-restart-pending"
RESTARTINFOFILE="/tmp/wifi-last-restart-marker-file"

# check if there are connections to other nodes via wireless meshing
WIFIMESHCONNECTIONS=0
if [ "$(batctl o | egrep "(ibss0|mesh0)]" | wc -l)" -gt 0 ]; then
	WIFIMESHCONNECTIONS=1
	echo "found wifi mesh partners."
	if [ ! -f "$MESHFILE" ]; then
		# create file so we can check later if there was a wifi mesh connection before
		touch $MESHFILE
	fi
fi

# check if there are local wifi batman clients
WIFIFFCONNECTIONS=0
if [ "$(batctl tl | grep W | wc -l)" -gt 0 ]; then
	# note: this doesn't help if the clients are on 5GHz, which might be unaffected by the bug
	WIFIFFCONNECTIONS=1
	echo "found batman local clients."
	if [ ! -f "$CLIENTFILE" ]; then
		# create file so we can check later if there were batman local clients before
		touch $CLIENTFILE
	fi
fi

# check for clients on private wifi device
WIFIPRIVCONNECTIONS=0
PIPE=$(mktemp -u -t workaround-pipe-XXXXXX)
mkfifo $PIPE
iw dev | grep "Interface wlan" | cut -d" " -f2 > $PIPE &
while read wifidev; do
	iw dev $wifidev station dump 2>/dev/null | grep -q Station
	if [ "$?" == "0" ]; then
		WIFIPRIVCONNECTIONS=1
		echo "found private wifi clients."
		if [ ! -f "$PRIVCLIENTFILE" ]; then
			# create file so we can check later if there were private wifi clients before
			touch $PRIVCLIENTFILE
		fi
		break
	fi
done < $PIPE
rm $PIPE

# check if the node can reach the default gateway
GWCONNECTION=0
GATEWAY=$(batctl gwl | grep "^=>" | awk -F'[ ]' '{print $2}')
if [ $GATEWAY ]; then
	batctl ping -c 5 $GATEWAY >/dev/null 2>&1
	if [ "$?" == "0" ]; then
		GWCONNECTION=1
		echo "can ping default gateway $GATEWAY ."
		if [ ! -f "$GWFILE" ]; then
			# create file so we can check later if there was a reachable gateway before
			touch $GWFILE
		fi
	else
		echo "can't ping default gateway $GATEWAY ."
	fi
else
	echo "no default gateway defined."
fi

WIFIRESTART=0
if [ "$WIFIMESHCONNECTIONS" -eq 0 ] && [ "$WIFIPRIVCONNECTIONS" -eq 0 ] && [ "$WIFIFFCONNECTIONS" -eq 0 ]; then
	if [ -f "$MESHFILE" ] || [ -f "$CLIENTFILE" ] || [ -f "$PRIVCLIENTFILE" ]; then
		# no wifi connections but there was one before
		WIFIRESTART=1
	fi
fi
if [ "$GWCONNECTION" -eq 0 ]; then
	if [ -f "$GWFILE" ]; then
		# no pingable gateway but there was one before
		WIFIRESTART=1
	fi
fi

if [ ! -f "$RESTARTFILE" ] && [ "$WIFIRESTART" -eq 1 ]; then
	# delaying wifi restart until the next script run
	touch $RESTARTFILE
	echo "wifi restart possible on next script run."
elif [ "$WIFIRESTART" -eq 1 ]; then
	echo "restarting wifi."
	rm -f $MESHFILE
	rm -f $CLIENTFILE
	rm -f $PRIVCLIENTFILE
	rm -f $RESTARTFILE
	touch $RESTARTINFOFILE
	wifi
else
	echo "everything seems to be ok."
	rm -f $RESTARTFILE
fi

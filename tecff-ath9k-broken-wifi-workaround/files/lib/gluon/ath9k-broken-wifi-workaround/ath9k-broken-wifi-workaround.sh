#!/bin/sh
#
# this script tries to recover nodes that have problems with wifi connections
#
# limitations:
# - restarts every ath9k radio device, not only affected ones
# - if all of	a) there are multiple radios
# 				b) at least one is not affected by the bug
# 				c) there are still batman clients using a working radio
# 				d) a gateway is reachable
# 		is true, this script fails to recover broken radios

SCRIPTNAME="ath9k-broken-wifi-workaround"

# check if node has wifi
if [ "$(ls -l /sys/class/ieee80211/phy* | wc -l)" -eq 0 ]; then
	logger -s -t "$SCRIPTNAME" -p 5 "node has no wifi, aborting."
	exit
fi

# don't do anything while an autoupdater process is running
pgrep autoupdater >/dev/null
if [ "$?" == "0" ]; then
	logger -s -t "$SCRIPTNAME" -p 5 "autoupdater is running, aborting."
	exit
fi

# don't run this script if another instance is still running
exec 200<$0
flock -n 200
if [ "$?" != "0" ]; then
	logger -s -t "$SCRIPTNAME" -p 5 "failed to acquire lock, another instance of this script might still be running, aborting."
	exit
fi

# check if node uses ath9k wifi driver
for i in $(ls /sys/class/net/); do
	if expr "$(readlink /sys/class/net/$i/device/driver)" : ".*/ath9k" >/dev/null; then
		# gather a list of interfaces
		if [ -n "$ATH9K_IFS" ]; then
			ATH9K_IFS="$ATH9K_IFS $i"
		else
			ATH9K_IFS="$i"
		fi
		# gather a list of devices
		if expr "$i" : "\(client\|ibss\|mesh\)[0-9]" >/dev/null; then
			ATH9K_UCI="$(uci show wireless | grep $i | cut -d"." -f1-2)"
			ATH9K_DEV="$(uci get ${ATH9K_UCI}.device)"
			if [ -n "$ATH9K_DEVS" ]; then
				if ! expr "$ATH9K_DEVS" : ".*${ATH9K_DEV}.*" >/dev/null; then
					ATH9K_DEVS="$ATH9K_DEVS $ATH9K_DEV"
				fi
			else
				ATH9K_DEVS="$ATH9K_DEV"
			fi
			ATH9K_UCI=
			ATH9K_DEV=
		fi
	fi
done

# check if the ath9k interface list is empty
if [ -z "$ATH9K_IFS" ] || [ -z "$ATH9K_DEVS" ]; then
	logger -s -t "$SCRIPTNAME" -p 5 "node doesn't use the ath9k wifi driver, aborting."
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
for wifidev in $ATH9K_IFS; do
	if expr "$wifidev" : "\(ibss\|mesh\)[0-9]" >/dev/null; then
		if [ "$(batctl o | egrep "$wifidev" | wc -l)" -gt 0 ]; then
			WIFIMESHCONNECTIONS=1
			logger -s -t "$SCRIPTNAME" -p 5	"found wifi mesh partners."
			if [ ! -f "$MESHFILE" ]; then
				# create file so we can check later if there was a wifi mesh connection before
				touch $MESHFILE
			fi
			break
		fi
	fi
done

# check if there are local wifi batman clients
WIFIFFCONNECTIONS=0
WIFIFFCONNECTIONCOUNT="$(batctl tl | grep W | wc -l)"
if [ "$WIFIFFCONNECTIONCOUNT" -gt 0 ]; then
	# note: this check doesn't know which radio the clients are on
	WIFIFFCONNECTIONS=1
	logger -s -t "$SCRIPTNAME" -p 5 "found batman local clients."
	if [ ! -f "$CLIENTFILE" ]; then
		# create file so we can check later if there were batman local clients before
		touch $CLIENTFILE
	fi
fi

# check for clients on private wifi device
WIFIPRIVCONNECTIONS=0
for wifidev in $ATH9K_IFS; do
	if expr "$wifidev" : "wlan[0-9]" >/dev/null; then
		iw dev $wifidev station dump 2>/dev/null | grep -q Station
		if [ "$?" == "0" ]; then
			WIFIPRIVCONNECTIONS=1
			logger -s -t "$SCRIPTNAME" -p 5 "found private wifi clients."
			if [ ! -f "$PRIVCLIENTFILE" ]; then
				# create file so we can check later if there were private wifi clients before
				touch $PRIVCLIENTFILE
			fi
			break
		fi
	fi
done

# check if the node can reach the default gateway
GWCONNECTION=0
GATEWAY=$(batctl gwl | grep -e "^=>" -e "^\*" | awk -F'[ ]' '{print $2}')
if [ $GATEWAY ]; then
	batctl ping -c 2 $GATEWAY >/dev/null 2>&1
	if [ "$?" == "0" ]; then
		logger -s -t "$SCRIPTNAME" -p 5 "can ping default gateway $GATEWAY , trying ping6 on NTP servers..."
		for i in $(uci get system.ntp.server); do
			ping6 -c 1 $i >/dev/null 2>&1
			if [ $? -eq 0 ]; then
				logger -s -t "$SCRIPTNAME" -p 5	"can ping at least one of the NTP servers: $i"
				GWCONNECTION=1
				if [ ! -f "$GWFILE" ]; then
					# create file so we can check later if there was a reachable gateway before
					touch $GWFILE
				fi
				break
			fi
		done
		if [ "$GWCONNECTION" -eq 0 ]; then
			logger -s -t "$SCRIPTNAME" -p 5 "can't ping any of the NTP servers."
		fi
	else
		logger -s -t "$SCRIPTNAME" -p 5 "can't ping default gateway $GATEWAY ."
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
	logger -s -t "$SCRIPTNAME" -p 5 "wifi restart possible on next script run."
elif [ "$WIFIRESTART" -eq 1 ]; then
	logger -s -t "$SCRIPTNAME" -p 5 "restarting wifi."
	[ "$GWCONNECTION" -eq 0 ] && rm -f $GWFILE
	rm -f $MESHFILE
	rm -f $CLIENTFILE
	rm -f $PRIVCLIENTFILE
	rm -f $RESTARTFILE
	touch $RESTARTINFOFILE
	for wifidev in $ATH9K_DEVS; do
		wifi down $wifidev
	done
	sleep 1
	for wifidev in $ATH9K_DEVS; do
		wifi up $wifidev
	done
else
	logger -s -t "$SCRIPTNAME" -p 5 "everything seems to be ok."
	rm -f $RESTARTFILE
fi

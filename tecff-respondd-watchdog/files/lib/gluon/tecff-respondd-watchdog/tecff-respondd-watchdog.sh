#!/bin/sh
#
# this script starts gluon-respondd if it isn't running
#

# don't do anything while an autoupdater process is running
pgrep autoupdater >/dev/null
if [ "$?" == "0" ]; then
	echo "autoupdater is running, aborting."
	exit
fi

# don't run this script if another instance is still running
LOCKFILE="/var/lock/tecff-respondd-watchdog.lock"
cleanup() {
	echo "cleanup, removing lockfile: $LOCKFILE"
	rm -f "$LOCKFILE"
	exit
}
if ( set -o noclobber; echo "$$" > "$LOCKFILE" ) 2> /dev/null; then
	trap cleanup INT TERM
else
	echo "failed to acquire lockfile: $LOCKFILE"
	echo "another instance of this script might still be running, aborting."
	exit
fi

RESTARTINFOFILE="/tmp/respondd-last-watchdog-start-marker-file"

# start respondd if it isn't running
pgrep respondd >/dev/null
if [ "$?" != "0" ]; then
	echo "respondd isn't running, starting it."
	/etc/init.d/gluon-respondd start
	touch $RESTARTINFOFILE
fi

cleanup

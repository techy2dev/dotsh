#!/bin/bash
USERNAME=$1
PASS=$2

MYSQL_USR="vpnworld_panel"
MYSQL_PASS="vpnworld_panel"
DB="vpnworld_panel"
host="melon.ukhost4u.com"
TBL="vpns"


echo $PASS;
if [ "$PASS" = "Stop" ] ; then
mysql -u$MYSQL_USR -p$MYSQL_PASS -h$host -s -e "use $DB;UPDATE $TBL  SET online=0 WHERE username='$USERNAME'"
echo "disconnected">'/temp/ss.txt'
else
echo $PASS>'/temp/ss.txt'
fi


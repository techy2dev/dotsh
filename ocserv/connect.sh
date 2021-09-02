#!/bin/bash

#Database Credentials#
HOST='localhost'
USER='root'
PASS='rootroot'
DB='vpn'
PORT='3306'
#Database Credentials#
DURATION=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "SELECT duration FROM vpns WHERE username='$USERNAME'"`
COUNT=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "SELECT count_online FROM vpns WHERE username='$USERNAME'"`

if [[ $DURATION == .1 ]]; then
	DURATION=3
else
	DURATION=$((30*DURATION))

fi

DATE=`(date "+%Y-%m-%d %H:%M:%S")`
EXPIRY=$(date "+%Y-%m-%d %H:%M:%S" -d "+$DURATION days")
EXPIRY2=$(date "+%Y-%m-%d" -d "+$DURATION days")
ACTIVATED=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "SELECT activated_at FROM vpns WHERE username='$USERNAME'"`
EXPIRED=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "SELECT status FROM vpns WHERE username='$USERNAME'"`
COUNT=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "SELECT count_online FROM vpns WHERE username='$USERNAME'"`
php /etc/ocserv/expiry.php > /etc/ocserv/server.txt
IFS=$'\n'
list=$(cat /etc/ocserv/server.txt)
myip=$(wget -qO- ipv4.icanhazip.com);

if [[ $ACTIVATED ]]; then

	if [[ $COUNT -gt 2 ]]; then
			exit 1
		elif [[ $EXPIRED == 'locked' ]]; then
			exit 1
		else
			mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE vpns SET online=1, count_online=count_online + 1 WHERE username='$USERNAME'"
	fi

else

	if [[ $COUNT -gt 2 ]]; then
			exit 1
		elif [[ $EXPIRED == 'locked' ]]; then
			exit 1
		else
			mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE vpns SET online=1, count_online=count_online + 1 WHERE username='$USERNAME'"
			mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE vpns SET activated_at='$DATE' WHERE username='$USERNAME'"
			mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE vpns SET expired_on='$EXPIRY' WHERE username='$USERNAME'"
			chage -E $EXPIRY2 $USERNAME

			for i in $list
			do
				ip=$(echo $i | awk '{print $1}')
				pass=$(echo $i | awk '{print $2}')
				if [[ $MYIP -ne $ip ]]
					sshpass -p "$pass" ssh -o StrictHostKeyChecking=no root@$ip "chage --expiredate '$EXPIRY' $USERNAME"
				fi
			done
	fi

fi

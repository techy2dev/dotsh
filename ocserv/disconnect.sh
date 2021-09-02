#!/bin/bash
#Database Credentials#
HOST='localhost'
USER='root'
PASS='rootroot'
DB='vpn'
PORT='3306'
#Database Credentials#

online =`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "SELECT count_online FROM vpns WHERE username='$USERNAME'"`

if [[ $online > 0 ]]; then

mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE vpns SET count_online=count_online - 1 WHERE username='$USERNAME'" 

else

mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE vpns SET online=0, count_online=count_online - 1 WHERE username='$USERNAME'" 

fi 

#!/bin/bash

USERNAME=$1
PASS=$2
##Authentication
data=$(curl -sb -X POST  -F "connect=true" -F "user=$USERNAME" -F "pass=$PASS" "https://vpnworld.co.uk/connect.php")

if [[ $data == 'invalid' ]]; then 
	echo "$USERNAME | $PASS is invalid"
	echo REJECT 
else
	echo ACCEPT
fi
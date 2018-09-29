#!/bin/bash

##insert code here

if [[ -z "$1"  ]]; then
	echo 'error: this command requires a string argument';
	exit 1;
fi
user=`whoami`;

cd /home/$user/Sync/scripts/;
cp /home/$user/Sync/scripts/defaultscript.sh $1;
echo 'New script successfully created:'

rmate $1;
##do not remove these 
##
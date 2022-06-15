#!/bin/bash

ip=`echo $1|awk -F '[@]' '{print $2}'`
fping -c1 -t300 $ip 2>/dev/null 1>/dev/null
if [ "$?" = 0 ]
then
    date +"%Y-%m-%d %H:%M:%S $ip Host found"
else
    date +"%Y-%m-%d %H:%M:%S $ip Host not found"
fi
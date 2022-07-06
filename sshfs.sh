#!/bin/bash

yoda1="$HOME/external/yoda1"
yoda2="$HOME/external/yoda2"
mounted=$(mount -t fuse.sshfs)

ip=`echo $1|awk -F '[@]' '{print $2}'`
date +"%Y-%m-%d %H:%M:%S looking for $ip"
fping -c1 -t300 $ip 2>/dev/null 1>/dev/null
if [ "$?" = 0 ]
then
    date +"%Y-%m-%d %H:%M:%S $ip found"

    if [[ $mounted == *$yoda1* ]]; then
        date +"%Y-%m-%d %H:%M:%S yoda1 already mounted"
    else
        date +"%Y-%m-%d %H:%M:%S mounting yoda1"
        sshfs $1:/data/part1 $HOME/external/yoda1 && date +"%Y-%m-%d %H:%M:%S successfully mounted yoda1"
    fi

    if [[ $mounted == *$yoda2* ]]; then
        date +"%Y-%m-%d %H:%M:%S yoda2 already mounted"
    else
        date +"%Y-%m-%d %H:%M:%S mounting yoda2"
        sshfs $1:/data/part2 $HOME/external/yoda2 && date +"%Y-%m-%d %H:%M:%S successfully mounted yoda2"
    fi
else
    date +"%Y-%m-%d %H:%M:%S $ip not found"
fi

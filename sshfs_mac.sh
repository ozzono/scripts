#!/bin/bash

yoda1="$HOME/external/yoda1"
yoda2="$HOME/external/yoda2"
mounted=$(mount -t fuse.sshfs)

ip=`echo $1|awk -F '[@]' '{print $2}'`
nw=`echo $ip|awk -F '[.]' '{print $1"."$2"."$3}'`
hostIP=`ifconfig en0|grep "inet "|awk -F '[ ]' '{print $2}'`
hostNW=`echo $hostIP |awk -F '[.]' '{print $1"."$2"."$3}'`
date +"%Y-%m-%d %H:%M:%S ip <$ip> - hostIP <$hostIP>"
date +"%Y-%m-%d %H:%M:%S nw <$nw> - hostNW <$hostNW>"

if [[ "$nw" == "$hostNW" ]]; then
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
    date +"%Y-%m-%d %H:%M:%S $ip Host not found"
fi

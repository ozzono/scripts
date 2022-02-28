#!/bin/bash

yoda1="$HOME/external/yoda1"
yoda2="$HOME/external/yoda2"
mounted=$(mount -t fuse.sshfs)

if [[ $mounted == *$yoda1* ]]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "yoda1 already mounted"
else
    echo $(date +"%Y-%m-%d %H:%M:%S") "mounting yoda1"
    sshfs $1:/data/part1 $HOME/external/yoda1 && echo $(date +"%Y-%m-%d %H:%M:%S") "successfully mounted yoda1"
fi

if [[ $mounted == *$yoda2* ]]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "yoda2 already mounted"
else
    echo $(date +"%Y-%m-%d %H:%M:%S") "mounting yoda2"
    sshfs $1:/data/part2 $HOME/external/yoda2 && echo $(date +"%Y-%m-%d %H:%M:%S") "successfully mounted yoda2"
fi

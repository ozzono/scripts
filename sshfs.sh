#!/bin/bash

yoda1="$HOME/external/yoda1"
yoda2="$HOME/external/yoda2"
mounted=$(mount -t fuse.sshfs)

if [[ $mounted == *$yoda1* ]]; then
    echo "mounted: yoda1"
else
    echo "Mounting yoda1"
    sshfs $1:/data/part1 $HOME/external/yoda1
fi

if [[ $mounted == *$yoda2* ]]; then
    echo "mounted: yoda2"
else
    echo "Mounting yoda2"
    sshfs $1:/data/part2 $HOME/external/yoda2
fi

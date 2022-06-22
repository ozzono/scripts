#!/bin/bash
while true; do
    id=$(pgrep bitcoind|wc -l)
    if test $id -eq 0
    then
        date +"%Y-%m-%d %H:%M:%S restarting bitcoind"
        sudo umount /mnt/gold-ssd
        sudo mount  /mnt/gold-ssd
    else
        date +"%Y-%m-%d %H:%M:%S bitcoind pid $id; running regularly"
    fi
    sleep 60;
done
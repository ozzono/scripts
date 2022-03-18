#!/bin/bash
watchpi(){
    while true ; do 
    if ping -c 1 raspberrypi.local > /dev/null ; then 
        date +"%Y-%m-%d %H:%M:%S rpi connected"
        sleep 60
    else 
        a=$(date +"%Y-%m-%d %H:%M:%S rpi node disconnected")
        notify-send "$a"
        sleep 30
    fi
    done
}

if [ -z $1 ]; then
    list=$(screen -ls)
    if [[ $list == *"watch_rpinode"* ]]; then
        date +"%Y-%m-%d %H:%M:%S watch_rpinode screen is already running"
    else
        date +"%Y-%m-%d %H:%M:%S starting watch_rpinode"
        screen -dmS watch_rpinode bash -c "$HOME/scripts/watch-rpi.sh watch"
    fi
else
    watchpi
fi

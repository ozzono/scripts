#!/bin/bash
watchpi(){
    while true ; do 
    if ping -c 1 raspberrypi.local > /dev/null ; then 
        echo "It works"
    else 
        notify-send "rpi node disconnected"
        sleep 25
    fi
    sleep 5
    done
}

if [ -z $1 ]; then
    list=$(screen -ls)
    if [[ $list == *"watch_rpinode"* ]]; then
        echo "watch_rpinode screen is already running"
    else
        echo "Starting watch_rpinode"
        screen -dmS watch_rpinode bash -c "$HOME/scripts/watch-rpi.sh watch"
    fi
else
    watchpi
fi

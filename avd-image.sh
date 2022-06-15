#!/bin/bash

lsscreen=$(screen -ls)

if [[ $lsscreen == *"avd-$1"* ]]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "avd-$1 already enabled"
else
    echo $(date +"%Y-%m-%d %H:%M:%S") "enabling avd-$1"
    screen -dmS fresh-corner bash -c `date +"%Y-%m-%d %H:%M:%S enabling avd-$1"; $HOME/Android/Sdk/emulator/emulator -avd $1`
fi

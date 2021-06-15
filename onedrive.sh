#/bin/bash

list=$(screen -ls)
if [[ $list == *"onedrive"* ]]; then
    echo "onedrives monitor is already running"
else
    echo "Starting onedrive monitor"
    screen -dmS onedrive bash -c 'onedrive -m'
fi

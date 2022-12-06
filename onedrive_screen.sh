#/bin/bash

list=$(screen -ls)
if [[ $list == *"onedrive"* ]]; then
    date +"%Y-%m-%d %H:%M:%S onedrive: sync is already running"
else
    date +"%Y-%m-%d %H:%M:%S onedrive: starting onedrive monitor"
    screen -dmS onedrive bash -c '~/scripts/onedrive_sync.sh'
fi


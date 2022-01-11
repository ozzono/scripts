#/bin/bash

# list=$(screen -ls)
# if [[ $list == *"foxkill"* ]]; then
#     echo "foxkills screens is already running"
# else
#     echo "Starting foxkill"
#     screen -dmS foxkill bash -c '/home/hugo/bin/foxkill'
# fi


kill $(pidof firefox)
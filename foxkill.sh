#/bin/bash

list=$(screen -ls)
if [[ $list == *"foxkill"* ]]; then
    echo "foxkills screens is already running"
else
    echo "Starting foxkill"
    screen -dmS foxkill bash -c 'go run /home/hugo/Projects/snippets/go-snippets/foxkill.go'
fi

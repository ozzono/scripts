#/bin/bash

list=$(screen -ls)
if [[ $list == *"vueui"* ]]; then
    echo "Vue ui already running"
else
    echo "Starting Vue ui"
    screen -dmS vueui bash -c 'vue ui'
fi

#!/bin/bash

firedock=$(screen -ls)

if [[ $firedock == *"firedock"* ]]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "firefox docker already enabled"
else
    echo $(date +"%Y-%m-%d %H:%M:%S") "enabling firefox docker refreshment"
    screen -dmS fresh-corner bash -c 'date +"%Y-%m-%d %H:%M:%S enabling firefox docker"; docker run -it --name firedock --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix --net=host firefox'
    
fi

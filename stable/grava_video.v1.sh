#!/bin/bash
now=$(date +%Y-%m-%d_%H:%M);
ffmpeg -video_size 1366x768 -framerate 15 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i pulse -acodec aac -strict experimental -vf scale=852:-1 '/home/administrador/Videos/Records/'$now.mp4

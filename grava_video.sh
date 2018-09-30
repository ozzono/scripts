#!/bin/bash

## 24/03/2018 - adding record duration argument
now=$(date +%Y-%m-%d_%H:%M);
usuario=$(whoami);

if [ "$1" -gt "-1" ]
	then
	#add sleep 5 seconds
	for (( i = 5; i > 1; i-- )); do
		sleep 1;
		echo $i;
	done
	echo $i":Vai!";
	ffmpeg -video_size 1366x768 -framerate 10 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i pulse -acodec aac -strict experimental -vf scale=852:-1 -t $1 '/home/'$usuario'/Videos/Records/'$now.mp4
else
	ffmpeg -video_size 1366x768 -framerate 10 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i pulse -acodec aac -strict experimental -vf scale=852:-1 '/home/'$usuario'/Videos/Records/'$now.mp4
fi
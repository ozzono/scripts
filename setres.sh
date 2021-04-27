#!/bin/bash

#run cvt <x> <y> <fps> to get below arguments
# cvt 1920 1080 60
# xrandr -q lists available video outputs

if [[ $(xrandr -q|grep 1920x1080|grep \* |wc -l) -eq "2" ]]; then
    echo "screen already configured"
    exit 1
fi
echo "configuring"

xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync

xrandr --addmode DP-2 1920x1080_60.00 # replace DP-! with the desired video output

xrandr --output DP-2 --mode 1920x1080_60.00


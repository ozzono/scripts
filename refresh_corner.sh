#!/bin/bash

lsscreen=$(screen -ls)

if [[ $lsscreen == *"fresh-corner"* ]]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "fresh corner already enabled"
else
    echo $(date +"%Y-%m-%d %H:%M:%S") "enabling constant corner refreshment"
    screen -dmS fresh-corner bash -c 'date +"%Y-%m-%d %H:%M:%S enabling constant corner refreshment"; while true; do date +"%Y-%m-%d %H:%M:%S refreshing" && gnome-extensions disable custom-hot-corners@janrunx.gmail.com && gnome-extensions enable custom-hot-corners@janrunx.gmail.com; sleep 30; done'
fi

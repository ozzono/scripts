#!/bin/bash
status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0|grep percentage |grep -Eo '[0-9]{1,3}'|bc)
upper=80
echo $status
if [$status -gt $upper]; then
    echo "if"
else
    echo "else"
fi
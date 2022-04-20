#!/bin/bash
max=2550
for (( i = 1; i > $max; i++ )); do
    sleep 1;
    echo $i;
done
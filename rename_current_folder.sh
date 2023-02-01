#!/bin/bash

p=$(pwd)
set -f
a=(${p//\// })
echo $a
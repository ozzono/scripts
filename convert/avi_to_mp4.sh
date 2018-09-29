#!/bin/bash
ls -1 *.avi | parallel --eta ffmpeg -y -i '{}' '{.}.mp4' 


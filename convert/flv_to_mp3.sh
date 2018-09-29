#!/bin/bash
ls -1 *.flv | parallel --eta ffmpeg -y -i '{}' '{.}.mp3' 


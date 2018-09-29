#!/bin/bash
ls -1 *.mp4 | parallel --eta ffmpeg -y -i '{}' '{.}.mp3'


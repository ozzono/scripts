#/bin/bash

leftpad(){
	echo $(printf %05d $1)
}

concat(){
	rm playlist.txt
	for counter in $(seq 1 $1)
		do 
			echo "file audio_$(leftpad $counter).aac" >> playlist.txt
		done;
}

concat $1
rm output.aac
ffmpeg -f concat -safe 0 -i playlist.txt -c copy output.aac
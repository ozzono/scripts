#/bin/bash

leftpad(){
	echo $(printf %05d $1)
	# echo $1
}

dl(){
	curl "https://cdn-brsp1.scaleplay.com.br/static/8a3ba885-1574-48af-ac30-3a2cf3e5a5c5/1c/48/41/video/1c484119-fa90-49bb-bb05-70b7db26c5ae_audio_default_por_$1.aac"\
	-H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0'\
	-H 'Accept: */*'\
	-H 'Accept-Language: en-US,en;q=0.5'\
	-H 'Accept-Encoding: gzip, deflate, br'\
	-H 'Origin: https://app.reallifeapp.com.br'\
	-H 'Connection: keep-alive'\
	-H 'Referer: https://app.reallifeapp.com.br/'\
	-H 'Sec-Fetch-Dest: empty'\
	-H 'Sec-Fetch-Mode: cors'\
	-H 'Sec-Fetch-Site: cross-site'\
	-H 'TE: trailers'\
	--output "audio_$1.aac"
}

rm audio_*.aac

for counter in $(seq 1 $1)
	do 
		dl $(leftpad $counter);
	done;


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
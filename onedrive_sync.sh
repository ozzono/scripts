#/bin/bash

while true
do
	date +"%Y-%m-%d %H:%M:%S syncing to onedrive"
	onedrive --synchronize
	date +"%Y-%m-%d %H:%M:%S synced"
	date +"%Y-%m-%d %H:%M:%S waiting 300"
	sleep 300
done


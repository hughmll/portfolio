#! /bin/bash

while true; do #invokes infinite loop
	read -p "Please type the URL of a file you'd like to download or enter 'exit' to quit: " URL
	if [[ $(echo -n $URL) = "exit" ]]; then #echo is used to remove trailing newline char from URL var
		break #breaks infinite loop if user input = exit
	else #if user input is anything other than exit, proceeds to request file save location
		read -p "Please type the location where you'd like to download the file to: " DIR
		wget -P "$DIR" "$URL" #uses wget -P command to specify download directory and URL
	fi
done

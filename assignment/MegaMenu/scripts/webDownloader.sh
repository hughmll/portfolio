#! /bin/bash

LIGHTBLUE="\033[1;34m"
ORANGE="\033[0;33m"
RESET="\033[0m"

while true; do #invokes infinite loop
	read -p "$(echo -e ${LIGHTBLUE}Please type the URL of a file to download or type exit to quit: ${RESET})" URL
	if [[ $(echo -n $URL) = "exit" ]]; then #echo is used to remove trailing newline char from URL var
		break #breaks infinite loop if user input = exit
	else #if user input is anything other than exit, proceeds to request file save location
		read -p "$(echo -e ${ORANGE}Please type the path to download the file to: ${RESET})" DIR
		wget -P "$DIR" "$URL" #uses wget -P command to specify download directory and URL
	fi
done

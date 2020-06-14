#! /bin/bash

ORANGE="\033[0;33m"
LIGHTBLUE="\033[1;34m"
RED="\033[0;31m"
RESET="\033[0m"

echo
read -p "$(echo -e ${ORANGE}type the name of the folder you would like to copy: ${RESET})" folderName
#if the name is a valid directory
if [ -d $folderName ]; then
	#copy it to a new location
	read -p "$(echo -e ${LIGHTBLUE}Type the name of the destination folder: ${RESET})" newFolderName
	cp -r $folderName $newFolderName
else
#print an error
echo
echo -e "${RED}I couldn't find that folder${RESET}"
fi
exit 0 

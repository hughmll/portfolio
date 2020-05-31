#! /bin/bash

ORANGE="\033[0;33m"
LIGHTBLUE="\033[1;34m"
RED="\033[0;31m"
RESET="\033[0m"

#asks the user to set a folder name
read -p "$(echo -e ${ORANGE}Please enter a folder name: ${RESET})" folderName
echo
#while condition is true (a folder with matching name already exists) 
#this will continue to request new folder name until condition is false
while [ -d $folderName ]; do
read -p "$(echo -e ${RED}Folder already exists with this name, please enter another: ${RESET})" folderName
done

#creates a folder using input
mkdir $folderName

#changes working directory to this location
cd $folderName

#asks for password and stores in password variable
read -s -p "$(echo -e ${LIGHTBLUE}Please enter a secret password: ${RESET})" password

#removes newline character from variable (to prevent it being included)
#and hashes password using sha256 function and outputs to text file
echo -n $password | sha256sum > secret.txt

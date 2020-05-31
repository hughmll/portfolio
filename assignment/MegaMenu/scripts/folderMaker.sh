#! /bin/bash

ORANGE="\033[0;33m"
RESET="\033[0m"

read -p "$(echo -e ${ORANGE}type the name of the folder you would like to create: ${RESET})" folderName
mkdir "$folderName"

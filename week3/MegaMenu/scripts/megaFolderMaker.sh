#!/bin/bash

LIGHTBLUE="\033[1;34m"
RED="\033[0;31m"

#If there aren't two arguments to the script
if [[ $1 =~ [0-9] ]] && [[ $2 =~ [0-9] ]]; then
	for ((i = $1; i <= $2; i++))
		do
		#Create a new folder for that number
		echo
		echo -e ${LIGHTBLUE}"> Creating directory number $i"${RESET}
		mkdir week$i #removed quotes around week$1 to prevent folders being created with quotation marks
	done
else
#Print an error and exit
	echo
	echo -e ${RED}Error, provide two numbers${RESET} && exit 0
fi

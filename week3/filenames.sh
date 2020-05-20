#! /bin/bash

while read -r line; do
	if [ -f "$line" ]; then
		echo "$line: This file exists"
	elif [ -d "$line" ]; then
		echo "$line: This directory exists"
	else
		echo "$line: I don't know what that is!"
	fi
done < $1

#!/bin/bash
 
 #This function prints a given error
 printError()
 {
 echo -e "\033[31mERROR:\033[0m $1"
 }
 
 #This function will get a value between the 2nd and 3rd arguments
 getNumber()
 {
 read -p "$1: " #Creates prompt for user input after printing first arg
 while (($REPLY != 42)); do # While loop if user input != 42
 	if (($REPLY < 42)); then
 		printError "Too Low"
 		read -p "$1: " 
 	elif (($REPLY > 42)); then
 		printError "Too High"
 		read -p "$1: "
 	fi
 done
 }
 
 echo "This is the start of the script"
 getNumber "Please type a number between 1 and 100"
 echo "You guessed correctly!" # Prints when while loop is closed thanks to successful guess

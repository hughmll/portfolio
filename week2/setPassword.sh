#! /bin/bash

#asks the user to set a folder name
read -p "Please enter a folder name: " folderName

#while condition is true (a folder with matching name already exists) 
#this will continue to request new folder name until condition is false
while [ -d $folderName ]; do
read -p "Folder already exists with this name, please enter another: " folderName
done

#creates a folder using input
mkdir $folderName

#changes working directory to this location
cd $folderName

#asks for password and stores in password variable
read -s -p "Please enter a secret password: " password

#removes newline character from variable (to prevent it being included)
#and hashes password using sha512 function and outputs to text file
echo -n $password | sha512sum > secret_password.txt

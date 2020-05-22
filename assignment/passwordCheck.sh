#! /bin/bash

#generates secret.txt file with hashed password for demonstration purposes
testPassword="ncc1701d"
echo -n $testPassword | sha256sum > secret.txt

#hides user input and stores it in password variable
read -s -p "Please enter your secret password for authentication: " password
echo # ensure the next message is printed on a new line

#conditional takes user input, removes newline char, hashes and then strips out the additional
#space and hyphen that are added after the hash value.
#This is compared to output of secret.txt with the additional chars also stripped.
#If additional chars not removed for either output, conditional will  be false regardless
if [[ $(echo -n $password | sha256sum | tr -d '\- ') = $(cat secret.txt | tr -d '\- ') ]]; then

#if conditional true
echo "Access Granted"
exit 0

#if conditional false
else
echo "Access Denied"
exit 1
fi


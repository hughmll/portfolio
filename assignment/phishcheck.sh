
#! /bin/bash

#apikey=1d2b0c22a63aa19c9101e3750e636559e900820c37c0653cf0ed6b97f4090


#This function performs uses curl to send HTTPS post request to the phishtank API.
#-d shows the URL, API key and requested response type (json) as parameters in the curl response.
url_check(){ 
result=$(curl -s -H "User-Agent: phishtank/ riker89" -d "url=$1&format=json&app_key=1d2b0c22a63aa19c9101e3750e636559e900820c37c0653cf0ed6b97f40903d1" \
 -X POST https://checkurl.phishtank.com/checkurl/ | sed -e 's/\:true}}/Yes/g' -e 's/\:true./Yes/g' -e 's/success/Successful/g' -e 's/\:false../No/g' -e 's/error/ERROR!/g')
#The output of the curl requested is piped into sed to convert some of the variables so they can be parsed later. 


#The json response format for URLs in the phishtank database is different to those that aren't.
#Only responses for URLs in the database contain the keyword valid so a grep check is performed.
#This ensures appropriate awk formatting is used for each json response type. 
if echo $result | grep -q 'valid'; then
	awk -v url="$1" 'BEGIN {FS="\""} {printf("\033[36m%-35s\033[0m | \033[36m%-14s\033[0m | \033[36m%-12s\033[0m | \033[1;31m%-12s\033[0m | \033[36m%-12s\033[0m | \n", url, $14, $27, $43, $30)}' <<< $result
else
	awk -v url="$1" 'BEGIN {FS="\""} {printf("\033[36m%-35s\033[0m | \033[36m%-14s\033[0m | \033[36m%-12s\033[0m | \033[1;31m%-12s\033[0m | \033[36m%-12s\033[0m | \n", url, $14, "No", "No", "None")}' <<< $result
fi
}


#This function takes a url as input from the user via the commandline.
from_cmdline(){
echo
read -p "Please type a URL beginning with 'http://' or 'https://' and press enter to perform a phish check: " url
echo
printf "\033[1;33m%-35s\033[0m | \033[1;33m%-14s\033[0m | \033[1;33m%-12s\033[0m | \033[1;33m%-12s\033[0m | \033[1;33m%-12s\033[0m | \n" "URL" "Search Status" "In Database" "Known Phish" "Phishtank ID"
url_check $url #The input is saved in the url variable and passed as an arg to the url_check function.
menu #recursion to menu function
}


#This function reads up to 5 lines from a text file (1 URL per line) containing valid URLs.
#The limit is set to 5 to avoid excessive requests.
from_file(){
echo
read -p "Please type the path of a text file containing URLs to phish check (max 5 URLs will be checked): " file
echo
if [ -f $file ]; then
  printf "\033[1;33m%-35s\033[0m | \033[1;33m%-14s\033[0m | \033[1;33m%-12s\033[0m | \033[1;33m%-12s\033[0m | \033[1;33m%-12s\033[0m | \n" "URL" "Search Status" "In Database" "Known Phish" "Phishtank ID"
  echo "---------------------------------------------------------------------------------------------------"
  num=0
  while read line; do #while loop read lines while num variable is less than 5.
    if (($num < 5)); then
      url_check $line #passes line as arg to url_check func.
      num=$((num+1)) #num variable incremented by 1.
    else
      break
    fi  
  done < $file
else
  echo -e "\033[1;31mFile not found\033[0m"
fi
menu #recursion to menu function.
}


#This is the greeting displayed when the script is first executed.
echo -e "\n\n		         \033[1;33mWelcome to Phishcheck\033[0m\n"
echo "This script allows you to check URLs against the OpenDNS Phishtank database."
echo "   Phishtank is a crowd-sourced phishing database that provides an API for"
echo "	    confirming if a web address is a known phishing site."
echo "---------------------------------------------------------------------------"


#This function displays the menu options.
menu(){
echo
echo -e "Please enter a number to select an option\n"
echo -e "\033[1;33m1. Check a single URL\n2. Check URLs from a text file\n3. Exit\033[0m"
read choice
case $choice in #case statement for input.

"1")
from_cmdline;;

"2")
from_file;;

"3")
exit 0;;

*) #catches any other input and displays error message.
echo
echo -e "\033[1;31mInvalid choice\033[0m"
menu #recursion if user input is invalid
esac
}

menu




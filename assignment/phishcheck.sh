 #! /bin/bash

#apikey=1d2b0c22a63aa19c9101e3750e636559e900820c37c0653cf0ed6b97f40903d1

url="http://upcarpets.com/ehnr/lloy/"

result=$(curl -H "User-Agent: phishtank/ riker89" -d "url=$url&format=json&app_key=1d2b0c22a63aa19c9101e3750e636559e900820c37c0653cf0ed6b97f40903d1" -X POST https://checkurl.phishtank.com/checkurl/ | sed -e 's/\:true,/Yes/g' -e 's/success/Successful/g')

if echo $result | grep -q 'verified'; then
	awk -v url="$url" 'BEGIN { 
	FS="\""; printf("\033[33m%-35s\033[0m | \033[33m%-14s\033[0m | \033[33m%-12s\033[0m | \033[33m%-8s\033[0m | \033[33m%-12s\033[0m | \n", "URL", "Search status", "In database", "Is Phish", "Phishtank ID")}
	{printf("\033[36m%-35s\033[0m | \033[36m%-14s\033[0m | \033[36m%-12s\033[0m | \033[1;31m%-8s\033[0m | \033[44m%-12s\033[0m | ", url, $14, $27, $37, $30)}' <<< $result
fi	


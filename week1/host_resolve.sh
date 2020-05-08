#! /bin/bash
INPUT=$1
#URL=$(host $INPUT)
URL=$(dig $INPUT +short)
IP=`echo $URL`
#IP=`echo $URL | cut -d ' ' -f 4`
echo "The IP address and location of $INPUT is: "
echo $IP

LOCATION=$(curl -s "http://ip-api.com/json/$IP")
echo $LOCATION | jq -r .country 




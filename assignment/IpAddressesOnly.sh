#! /bin/bash

cd .. #Backs up one directory
week4/IpInfo.sh | sed -n '/IP Address:/p' #Executes IpInfo.sh script and passes output to sed

#Piping directly to sed rather than to a variable preserves original
#formatting of IpInfo.sh output


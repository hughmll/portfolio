#! /bin/bash

#Pipes output of IpInfo.sh straight into a further sed command
cd ..
week4/IpInfo.sh | sed -n '/IP Address:/p'

#Piping directly to sed rather than to a variable preserves original
#formatting of IpInfo.sh output


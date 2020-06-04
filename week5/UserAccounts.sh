#! /bin/bash

#this script uses awk to format the output from /etc/passwd

awk ' BEGIN {

#in the below, the colour codes are combined with % and -[NUM]s to instruct awk to apply the colour to the
#output, pull the variable in the order listed at the end and left justify by X number of spaces
FS=":"; printf("\033[33m%-25s\033[0m | \033[33m%-8s\033[0m | \033[33m%-8s\033[0m | ", "Username", "UserID", "GroupID");
printf("\033[33m%-22s\033[0m | \033[33m%-20s\033[0m |\n", "Home", "Shell");
print"_________________________________________________________________________________________________"};

#$7 tells AWK to only print lines where the 7th field matches /bin/bash.
#The forward slashes in /bin/bash must be escaped as they function as the pattern boundaries
$7 ~ /\/bin\/bash/ {printf("\033[35m%-25s\033[0m | \033[36m%-8s\033[0m | \033[36m%-8s\033[0m | ", $1, $3, $4)}
$7 ~ /\/bin\/bash/ {printf("\033[36m%-22s\033[0m | \033[36m%-20s\033[0m |\n", $6, $7)}' /etc/passwd #this calls /etc/passwd as the input

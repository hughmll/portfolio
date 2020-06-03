#! /bin/bash

echo "Google Server IPs:"
awk 'BEGIN {
FS=":"; 
print "________________________________";
print "| \033[34mServer Type\033[0m | \033[34mIP\033[0m             |";
}
{printf("| \033[33m%-11s\033[0m | \033[35m%-14s\033[0m |\n", $1, $2) 
}
END {
print "________________________________";
}' input.txt

#BEGIN tells awk to do the following within curly braces before handling first line
#FS is the field separator. The default FS is space
#printf allows formatting variables in a string similar to python's .format()
#in the above, left justification of fields $1 and $2 is specified using -11 and -14
#END tells awk to carry out actions once all lines have been handled

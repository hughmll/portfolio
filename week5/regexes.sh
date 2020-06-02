#! /bin/bash

#takes cli arg for directory to perform recursive search within.

grep -r "sed" $1 #looks for lines matching sed
grep -r -i "^m" $1 #looks for lines beginning with m or M
grep -r -E "[0-9]{3}[^0-9]" $1 #looks for lines with only 3 digit numbers
grep -r -i -E "echo [\'\"]?[a-z]* [a-z]* [a-z]*" $1 #looks for lines that include echo followed by 3 words
grep -r -P "(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" $1
# matches passwords 8 characters or longer including numbers, capitals and special characters (Mombrea, 2013)


#References
#Mombrea, M. (2013). How to validate password strength using a regular expression [PERL]. Retrieved from
#https://www.itworld.com/article/2833081/how-to-validate-password-strength-using-a-regular-expression.html

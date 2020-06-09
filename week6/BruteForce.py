#! /usr/bin/python
import hashlib
import string
import itertools as it

charlist = string.ascii_lowercase + string.digits #combines a-z with 0-9

passwordHash = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824" #hash of 'hello'
#passwordHash = "ca5ba87c93d42f8a45c1e0f569bba8bac92c80f4ce6c864bd44d136572411b7e" #hash of 'ab1' to quickly test working

for i in range(1,10): #performs a brute force for passwords between 1 and 9 characters long
    brutePw = it.product(charlist, repeat=i)
    #uses the iterools product method to generate combination of
    #all characters in charlist to length of repeat. If you knew length of password
    #the repeat=num could be changed to the known length for a much quicker attack
    for item in brutePw:
        word = ''.join(item)
        #product method creates tuples so these are converted to strings
        #prior to hashing
        hashResult = hashlib.sha256(word.encode("utf-8")).hexdigest()
        print(f"Trying password {word}:{hashResult}")
        if(hashResult == passwordHash):
            print(f"Password has been cracked! It was {word}")
            break
    else:
        continue
    break
    #the above nested breaks are used to prevent the script
    #from continuing even after the match is found. I found this solution
    #at the following link: https://stackoverflow.com/questions/189645/how-to-break-out-of-multiple-loops/58333359

    #NOTES
    #This script only performs a lowercase letter and number bruteforce based on the passwords in the original wordlist.
    #It assumes that the length is unknown and therefore tries all combinations beginning with a length of 1.
    #Realistically, depending on the password policy, you could normally start with a length of 8 or greater.
    #The bruteforce with the current character set alone is already extremely lengthy. This illustrates the
    #utility of including uppercase letters and special characters in a password to further thwart brute
    #force attempts.


    #REFERENCES
    #Santilli, C. (2019, January 10). Re: How to break out of multiple loops [Discussion post]. Stack Overflow
    #https://stackoverflow.com/questions/189645/how-to-break-out-of-multiple-loops/58333359




 

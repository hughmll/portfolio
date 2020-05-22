#! /bin/bash

#operation types stored in variables for use in calc function.
PLUS="+"
MINUS="-"
MULTIPLY="*"
DIVIDE="/"

#output colour codes stored in variables for cleaner looking calc function.

LIGHTBLUE="\033[1;34m"
ORANGE="\033[0;33m"
GREEN="\033[0;32m"
RED="\033[0;31m"
PURPLE="\033[0;35m"
RESET="\033[0m"


calc() {
  read -p "$(echo -e ${LIGHTBLUE}Enter first integer: ${RESET})" INT1 #takes first number from user.
  read -p "Enter operation to perform (+, -, * or /): " OP #takes operation to perform.
  read -p "$(echo -e ${LIGHTBLUE}Enter second integer: ${RESET})" INT2 #takes second number from user.

  case $OP in #uses case statement to determine which operation to perform.
   "+")

  RESULT=$(($INT1 $OP $INT2))
  echo -e ${LIGHTBLUE}$RESULT${RESET};;

  "-")
  RESULT=$(($INT1 $OP $INT2))
  echo -e ${GREEN}$RESULT${RESET};;

  "*")
  RESULT=$(($INT1 $OP $INT2))
  echo -e ${RED}$RESULT${RESET};;

  "/")
  echo -e ${PURPLE}$(awk "BEGIN {printf \"%.2f\n\", $INT1/$INT2}")${RESET};; #used awk to perform a floating point division to within 2 decimal places.

  esac

#if statement asks if user would like .to perform another calculation.
#Response of Y or y triggers recursion.
  read -p "Would you like to do another calculation? (Y/N): " ANSWER
  if [ "$ANSWER" = "Y" ] || [ "$ANSWER" = "y" ]; then
    calc
  fi
  exit 0
}

calc

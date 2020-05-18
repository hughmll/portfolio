#! /bin/bash

#operation types stored in variables for use in calc function.
PLUS="+"
MINUS="-"
MULTIPLY="*"
DIVIDE="/"

#output colour codes stored in variables for cleaner looking calc function.
BLUE="\033[0;34m"
GREEN="\033[0;32m"
RED="\033[0;31m"
PURPLE="\033[0;35m"
RESET="\033[0m"


calc() {
  read -p "Enter first integer: " INT1 #takes first number from user.
  read -p "Enter operation to perform (+, -, * or /): " OP #takes operation to perform.
  read -p "Enter second integer: " INT2 #takes second number from user.

  case $OP in #uses case statement to determine which operation to perform.
   "+")

  RESULT=$(($INT1 $OP $INT2))
  echo -e ${BLUE}$RESULT${RESET};;

  "-")
  RESULT=$(($INT1 $OP $INT2))
  echo -e ${GREEN}$RESULT${RESET};;

  "*")
  RESULT=$(($INT1 $OP $INT2))
  echo -e ${RED}$RESULT${RESET};;

  "/")
  awk "BEGIN {printf \"%.2f\n\", $INT1/$INT2}";; #used awk to perform a floating point division to within 2 decimal places.

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

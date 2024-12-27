#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


QUERY_DB () {
  echo $1


}

if [[ ! -z $1 ]]
then
  case $1 in
  # if $1 is a string, then I need to run check on element symbol and name
  ''|*[!0-9]*) 
  SYMBOL_SELECTION=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
  NAME_SELECTION=$($PSQL "SELECT * FROM elements WHERE name='$1'")
  if [[ -z $SYMBOL_SELECTION && -z $NAME_SELECTION ]]
  then
    echo I could not find that element in the database.
  else
    if [[ -z $SYMBOL_SELECTION ]]
    then
      QUERY_DB "$NAME_SELECTION"
    else
      QUERY_DB "$SYMBOL_SELECTION"
    fi
  fi ;;
  # if $1 is a number, then I need to run select on atomic_number in elements table
  *)  
  NUMBER_SELECTION=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1")
  if [[ -z $NUMBER_SELECTION ]]
  then
    echo I could not find that element in the database.
  else
    QUERY_DB "$NUMBER_SELECTION"
    
  fi
    ;;
  esac
else
  echo Please provide an element as an argument.
fi

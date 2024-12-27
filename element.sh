#!/bin/bash

if [[ ! -z $1 ]]
then
  case $1 in
  # if $1 is a string, then I need to run check on element symbol and name
  ''|*[!0-9]*) echo String ;;
  # if $1 is a number, then I need to run select on atomic_number in elements table
  *)  echo Number;;
  esac
else
  echo Please provide an element as an argument.
fi

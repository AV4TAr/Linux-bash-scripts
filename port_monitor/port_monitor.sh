#!/bin/bash

E_BADARGS=65

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` domain.com"
  exit $E_BADARGS
fi 


host=$1
shift
for port in "$@" 
#for port in 80 25 
do
  if netcat -z $host $port
  then
    echo port $port is up
  else
    echo port $port is down
  fi
done

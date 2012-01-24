#!/bin/bash

E_BADARGS=65

if [ ! -n "$2" ]
then
  echo "Usage: `basename $0` domain.com port1 port2 ..."
  exit $E_BADARGS
fi 

host=$1
shift

for port in "$@" 
do
  if netcat -z $host $port
  then
    echo port $port is up
  else
    echo port $port is down
  fi
done

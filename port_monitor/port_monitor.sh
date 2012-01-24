#!/bin/bash

E_BADARGS=65

if [ $# -lt 2 ]
then
  echo "Usage: `basename $0` domain.com port1 port2 ..."
  exit $E_BADARGS
fi 

host=$1
shift

echo Checking $host

for port in "$@" 
do
  if netcat -z $host $port
  then
    echo $port UP 
  else
    echo $port DOWN
  fi
done

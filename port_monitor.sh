#!/bin/bash

E_BADARGS=65

if [ ! -n "$1" ]
then
  echo "Usage: port_monitor.sh domain.com"
  exit $E_BADARGS
fi 


host=$1
#host=google.com
for port in 80 25 
do
  if netcat -z $host $port
  then
    echo port $port is up
  else
    echo port $port is down
  fi
done

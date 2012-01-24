host=google.com
for port in  80 25 
do
  if netcat -z $host $port
  then
    echo port $port is up
  else
    echo port $port is down
  fi
done

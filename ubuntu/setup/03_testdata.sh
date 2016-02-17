#!/bin/bash

source `dirname $0`/config.sh

cd $directory

./localdev.js run zen &

PID=$!

# http://stackoverflow.com/a/12121838
# try to connect
while ! wget -q -O - http://localhost:8000 1>/dev/null 
do
  sleep 1
done

echo "wainting 20 seconds to make sure zen is running..."
sleep 20

./localdev.js testdata zen

sleep 10

kill $PID
wait $PID


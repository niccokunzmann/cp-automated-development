#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE "Add Test Data"
COMMENT "see https://github.com/CoderDojo/cp-local-development#test-data"

IN_REPOSITORY

./localdev.js run zen &

PID=$!

# http://stackoverflow.com/a/12121838
# try to connect
while ! wget -q -O - http://localhost:8000 1>/dev/null 
do
  sleep 1
done

NOTE "Wainting 20 seconds to make sure zen is running..."
sleep 20

./localdev.js testdata zen

sleep 10

kill $PID || true
wait $PID || true


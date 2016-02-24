#!/bin/bash

echo -n "Starting build on docker hub ... "

curl -H "Content-Type: application/json" \
     --data '{"build": true}' \
     -X POST https://registry.hub.docker.com/u/coderdojo/cp-automated-development/trigger/a55a66b3-1863-49ab-a7a4-c50effd3a99d/

echo
echo "You can visit "
echo "  https://hub.docker.com/r/coderdojo/cp-automated-development/builds/"
echo "to see if it builds."

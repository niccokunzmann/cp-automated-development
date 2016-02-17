#!/bin/bash

source `dirname $0`/config.sh

echo
echo -------------------------------------------------------------------------------
echo localdev init
echo =============
echo see https://github.com/CoderDojo/cp-local-development#localdev-init
echo

cd $directory

cp ../setup/local-env.js .

git pull
./localdev.js init zen

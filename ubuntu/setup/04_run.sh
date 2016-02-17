#!/bin/bash

source `dirname $0`/config.sh

cd $directory
./localdev.js run zen

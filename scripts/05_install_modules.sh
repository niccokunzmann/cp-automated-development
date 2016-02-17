#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE   "Install the nodejs modules"
COMMENT "This can take a long time."

IN_REPOSITORY

npm install

if ! ./localdev.js
then 
  ERROR "localdev.js does not work."
fi
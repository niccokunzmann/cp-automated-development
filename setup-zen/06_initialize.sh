#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE localdev init
COMMENT "see https://github.com/CoderDojo/cp-local-development#localdev-init"

IN_REPOSITORY

./localdev.js init zen

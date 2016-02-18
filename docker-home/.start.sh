#!/bin/bash

# this file runs the shell and commands you use for the docker container

set -e

export HOME="`pwd`"

source .bashrc
if [ -f ".nvm/nvm.sh" ]
then
  source .nvm/nvm.sh
fi

if [ -n "$1" ]
then
  # we have arguments
  bash -c "$@"
  exit $?
else
  bash
fi
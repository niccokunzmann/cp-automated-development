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
  echo "$@" > /tmp/start.sh
  bash /tmp/start.sh
  exit_code=$?
  rm -f /tmp/start.sh
  exit $exit_code
else
  bash
fi

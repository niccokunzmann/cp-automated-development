#!/bin/bash

# this file runs the shell and commands you use for the docker container
# When you edit it keep in mind that it is not yet read into memory and will be executed further
# when you save it and exit the container.

# start postgresql on enter
sudo /etc/init.d/postgresql start > /dev/null

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
else
  bash
  exit_code=$?
fi

exit $exit_code

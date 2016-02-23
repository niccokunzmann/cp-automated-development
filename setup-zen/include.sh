#!/bin/bash
# This file checks for the configuration is right 
# to ensure that the installation goes smoothly.

set +e

for file in "$HOME/.nvm/nvm.sh" "$HOME/.bashrc"
do
  if [ -f "$file" ]
  then
    source "$file"
  fi
done

set -e

commented=false

function TITLE() {
  echo
  echo "+------------------------------------------------------------------------------"
  echo "| $@"
  echo "+------------------------------------------------------------------------------"
  commented=false
} 

function SUBTITLE() {
  echo
  echo "===== $@ ====="
  commented=false
} 


function COMMENT() {
  if [ "$commented" == "false" ]
  then
    echo "|"
  fi
  echo "| $@"
  commented=true
}

function WARN() {
  echo
  echo "WARNING: $@"
}

function ERROR() {
  echo
  echo "ERROR: $@"
  exit 1
}

function NOTE() {
  echo
  echo "NOTE: $@"
}

function PACKAGES() {
  sudo apt-get -y -qq install "$@"
# remove all unnecessary packages
#   https://help.ubuntu.com/community/AptGet/Howto
  sudo apt-get clean
  sudo apt-get autoremove

}

function PACKAGE() {
  PACKAGES "$@"
}


function CONFIG_ERROR() {
  ERROR "In config.sh: $@"
}

# Do not set the path of we include mutiple times
# absolute_repository_path=
function IN_REPOSITORY() {
  if [ -z "$absolute_repository_path" ]
  then
    cd "$cp_local_development_folder"
    absolute_repository_path="`pwd`"
  else
    cd "$absolute_repository_path"
  fi
  NOTE "Working in \"`pwd`\""
}

# --------------
# ensure we are correctly configured

source "`dirname \"$0\"`/config.sh"

if ! [ "$install_nodejs" == "yes" ] && ! [ "$install_nodejs" == "no" ]
then
  CONFIG_ERROR "install_nodejs value in config.sh should be either \"no\" or \"yes\"."
fi

if [ -z "$cp_local_development_url" ]
then
  CONFIG_ERROR "cp_local_development_url has no value but it should point to a valid git repository."
fi


if [ -z "$cp_local_development_branch" ]
then
  CONFIG_ERROR "cp_local_development_branch has no value but it should contain a branch name."
fi








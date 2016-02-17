#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE   "Install NodeJS"
COMMENT "following the tutorial at"
COMMENT "  http://www.nearform.com/nodecrunch/nodejs-sudo-free/"

SUBTITLE "Install NVM"

apt-get -y -qq install curl
curl -q https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash

for file in "~/.nvm/nvm.sh" "~/.bashrc"
do
  if [ -f "$file" ]
  then
    source "$file"
  else
    WARN "File \"$file\" not found."
  fi
done


if ! type nvm 1>/dev/null 2>/dev/null
then
  ERROR "\"nvm\" command not found."
  exit 1
fi

nvm install stable

nvm alias default stable

 
NOTE "searching for compatible nvm versions v0.10.*"
nvm_latest_version=`nvm ls-remote | grep -E "(^|\s)v?0\.10\." | tail -n1 | grep -E -o '\S+$'`
NOTE "nvm version to install is $nvm_latest_version"
 

if [ "$nvm_latest_version" == "" ]
then
  ERROR "Did not find any version compatible with v0.10.*"
fi

nvm install $nvm_latest_version
nvm use $nvm_latest_version
nvm alias default $nvm_latest_version

SUBTITLE "Install git"

PACKAGE git

SUBTITLE "Install npm"

npm -g install npm@latest

SUBTITLE "Install grunt"

npm install -g grunt

SUBTITLE "Allow root installation for bower"
COMMENT "This is needed if the installing user is root"
COMMENT "The installing user is root in case we are in a docker container."

#   http://stackoverflow.com/a/25674462
sudo bash -c "echo '{ \"allow_root\": true }' > /root/.bowerrc"
#   https://github.com/npm/npm/issues/3497#issuecomment-51959226
sudo bash -c "echo 'unsafe-perm=true' >/root/.npmrc"

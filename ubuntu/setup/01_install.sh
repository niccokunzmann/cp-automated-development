#!/bin/bash

source `dirname $0`/config.sh

echo
echo -------------------------------------------------------------------------------
echo install node js
echo ---------------
echo following the tutorial at
echo   http://www.nearform.com/nodecrunch/nodejs-sudo-free/
echo

apt-get -y -qq install curl
curl -q https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash

source ~/.bashrc
source ~/.nvm/nvm.sh

if ! type nvm 1>/dev/null 2>/dev/null
then
  echo "ERROR: nvm not found"
  nvm
  exit 1
fi

nvm install stable

nvm alias default stable

echo 
echo "searching for compatible nvm versions v0.10.*"
nvm_latest_version=`nvm ls-remote | grep -E "(^|\s)v?0\.10\." | tail -n1 | grep -E -o '\S+$'`
echo "nvm version to install is $nvm_latest_version"
echo 

if [ "$nvm_latest_version" == "" ]
then
  echo "Did not find any version compatible with v0.10.*"
  exit 1
fi

nvm install $nvm_latest_version
nvm use $nvm_latest_version
nvm alias default $nvm_latest_version

echo
echo -------------------------------------------------------------------------------
echo install additional packages
echo ---------------------------
echo

apt-get -y -qq install git

npm -g install npm@latest

npm install -g grunt

# install bower and allow root install
#   http://stackoverflow.com/a/25674462
sudo bash -c "echo '{ \"allow_root\": true }' > /root/.bowerrc"
#   https://github.com/npm/npm/issues/3497#issuecomment-51959226
sudo bash -c "echo 'unsafe-perm=true' >/root/.npmrc"

echo
echo -------------------------------------------------------------------------------
echo Code Setup
echo ==========
echo See https://github.com/CoderDojo/cp-local-development#code-setup
echo 

mkdir -p "$directory"

cd "$directory"

git clone $clone_url . || git pull $clone_url || { echo "ERROR: Directory \"`pwd`\" not usable. Content: `ls`"; exit 1; }

# command not found g++
# /usr/share/unicode/UnicodeData.txt not found.
# Error: Command failed: tar (child): bzip2: Cannot exec: No such file or directory
#    https://github.com/Medium/phantomjs/issues/133
echo "Installing packages ..."
apt-get -y -qq install g++ gcc unicode-data python wget make bzip2 postgresql-client || { echo "ERROR: Dependencies could not be installed. This will cause later crashes."; exit 1 ; }

npm install

./localdev.js || { echo "ERROR: \"./localdev.js\""; exit 1; }

# remove all unnecessary packages
#   https://help.ubuntu.com/community/AptGet/Howto
apt-get clean


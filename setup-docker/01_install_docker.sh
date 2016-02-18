#!/bin/bash


if ! type docker 2>>/dev/null
then
  # https://github.com/gliderlabs/docker-consul/issues/60#issuecomment-104561023
  sudo wget -qO- https://get.docker.com/ | sh 
fi

# http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo
sudo groupadd docker
sudo gpasswd -a ${USER} docker
# https://help.ubuntu.com/community/CheckingYourUbuntuVersion

sudo service docker restart

# install docker compose 
#   https://docs.docker.com/compose/install/
sudo apt-get -y install curl
if ! type docker-compose
then
  sudo bash -c "curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
  sudo chmod +x /usr/local/bin/docker-compose
else
  echo "\"docker-compose\" already installed."
fi

# check docker and docker-compose
EXIT=false
if ! type docker
then
  EXIT=true
  echo "Command \"docker\" not found!"
  echo "Use \"sudo delgroup docker\" if you accidentially installed docker but need to install docker.io."
fi
if ! type docker-compose
then
  EXIT=true
  echo "Command \"docker-compose\" not found!"
fi

if [ "$EXIT" == "true" ]
then
  echo "ERROR!"
  exit 1
fi

# both work
if docker info 1>>/dev/null 2>>/dev/null
then
  echo
  echo "You do NOT need to log out and in - the \"docker\" command can be used without sudo."
else
  echo
  echo "You must log out and in to use the \"docker\" command without super user privileges."
fi

#!/bin/bash
## This is a shell script that allows you to configure the installation.

## cp_local_development_url is the url we clone the repository from.
## You can change the configuration of all repositories later 
## and add your own remote.
cp_local_development_url='https://github.com/CoderDojo/cp-local-development.git'
## Use the following line to use ssh instead of https
#cp_local_development_url='git@github.com:CoderDojo/cp-local-development.git'

## cp_local_development_folder is the folder into which the repository 
## specified by cp_local_development_url should be cloned.
cp_local_development_folder="cp-local-development"
## Uncomment the following line to put it into the home folder
#cp_local_development_folder="~/cp-local-development"

# cp_local_development_branch is the branch which should be checked out.
cp_local_development_branch=master


## install_nodejs is a yes or no whether to install nodejs 
## during the installation steps (yes) or whether to use the local installation (no).
## When choosing no, be sure to use the right version.
install_nodejs=yes



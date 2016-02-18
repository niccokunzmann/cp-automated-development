#!/bin/bash

installation_directory="`dirname \"$0\"`"

source "$installation_directory/01_install_nodejs.sh"
source "$installation_directory/02_clone_repository.sh"
source "$installation_directory/03_install_packages.sh"
source "$installation_directory/04_install_postgresql.sh"
source "$installation_directory/05_install_modules.sh"
source "$installation_directory/06_initialize.sh"
source "$installation_directory/07_testdata.sh"



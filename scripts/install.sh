#!/bin/bash

dir="`dirname \"$0\"`"

source "$dir/01_install_nodejs.sh"
source "$dir/02_clone_repository.sh"
source "$dir/03_install_packages.sh"
source "$dir/04_install_postgresql.sh"
source "$dir/05_install_modules.sh"
source "$dir/06_initialize.sh"
source "$dir/07_testdata.sh"



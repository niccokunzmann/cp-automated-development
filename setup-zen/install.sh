#!/bin/bash

set -e

sudo apt-get update

local_directory="`dirname \"$0\"`"

date_of_installation_start=$(date +"%s")

for file in 01_install_nodejs.sh 02_clone_repository.sh 03_install_packages.sh 04_install_postgresql.sh 05_install_modules.sh 06_initialize.sh 07_testdata.sh
do
  "$local_directory/$file"
done

date_of_installation_end=$(date +"%s")
installation_duration=$(($date_of_installation_end-$date_of_installation_start))
echo "Installation took $(($installation_duration / 60))m $(($installation_duration % 60))s."

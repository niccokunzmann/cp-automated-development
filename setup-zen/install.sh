#!/bin/bash

cd "`dirname \"$0\"`"


for file in 01_install_nodejs.sh 02_clone_repository.sh 03_install_packages.sh 04_install_postgresql.sh 05_install_modules.sh 06_initialize.sh 07_testdata.sh
do
  "./$file"
done
  





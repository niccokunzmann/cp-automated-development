#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE "Install packages"
SUBTITLE "Install Packages for Zen"

PACKAGES g++ gcc unicode-data python wget make bzip2 postgresql-client

SUBTITLE "Install Packages for Test Setup"

NOTE "Installing packages for tests ..."
# root@zen:/user/src/app/cp-local-development/workspace-zen/cp-zen-platform# npm test
#    18 12 2015 10:54:05.918:ERROR [phantomjs.launcher]: /user/src/app/cp-local-development/workspace-zen/cp-zen-platform/node_modules/phantomjs/lib/phantom/bin/phantomjs: error while loading shared libraries: libfreetype.so.6: cannot open shared object file: No such file or directory
#    -> libfreetype
#    /user/src/app/cp-local-development/workspace-zen/cp-zen-platform/node_modules/phantomjs/lib/phantom/bin/phantomjs: error while loading shared libraries: libfontconfig.so.1: cannot open shared object file: No such file or directory
#    -> libfontconfig
PACKAGES libfreetype6 libfontconfig

NOTE "Changing locale for tests"
# root@zen:/user/src/app/cp-local-development/workspace-zen/cp-zen-platform# npm test
#     PhantomJS 1.9.8 (Linux 0.0.0) review-champion-application-controller load dojo lead FAILED
#         Error: Unexpected request: GET /locale/data?format=mf&lang=C
#         Expected GET /locale/data?format=mf&lang=en_IE
sudo locale-gen en_IE
# not sure if this is necessary
sudo update-locale LANG=en_IE
export LANG=en_IE
echo "
# updating language for tests from $0
export LANG=en_IE" >> ~/.bashrc
# cp-e2e-tests# npm test --tag smoke
#    Starting selenium server... 
#    An error occurred while trying to start Selenium. Check if JAVA is installed on your machine.
if ! type java 2>>/dev/null
then
  NOTE "java not found, installing java"
  # https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
  PACKAGE default-jre
fi

#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE   "Install postgresql"
COMMENT "following the tutorial at"
COMMENT "  https://help.ubuntu.com/community/PostgreSQL"

SUBTITLE "Install Packages"

PACKAGES postgresql postgresql-contrib pgadmin3

sudo /etc/init.d/postgresql start

SUBTITLE "Create Postgres Users"
COMMENT "Creating two users \"platform\" and \"`whoami`\" with password \"$postgres_platform_user_password\"."

postgres_platform_user_password="QdYx3D5y"
sudo -u postgres psql -c "create user platform with superuser password '$postgres_platform_user_password';"
sudo -u postgres psql -c "create user `whoami` with superuser password '$postgres_platform_user_password';"
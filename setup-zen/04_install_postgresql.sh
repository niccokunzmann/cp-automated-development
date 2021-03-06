#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE   "Install postgresql"
COMMENT "following the tutorial at"
COMMENT "  https://help.ubuntu.com/community/PostgreSQL"

SUBTITLE "Install Packages"

PACKAGES postgresql postgresql-contrib pgadmin3

sudo /etc/init.d/postgresql start

SUBTITLE "Create Postgres Users"

postgres_platform_user_password="QdYx3D5y"
COMMENT "Creating two users \"platform\" and \"`whoami`\" with password \"$postgres_platform_user_password\"."

sudo -u postgres psql -c "create user platform with superuser password '$postgres_platform_user_password';"
sudo -u postgres psql -c "create user `whoami` with superuser password '$postgres_platform_user_password';"

sudo cp "`dirname \"$0\"`/pg_hba.conf" /etc/postgresql/*/main/pg_hba.conf

sudo /etc/init.d/postgresql restart

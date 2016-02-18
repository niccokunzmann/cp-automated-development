#!/bin/bash

source "`dirname \"$0\"`/include.sh"

TITLE   "Get the Source Code"
COMMENT "As specified in the config.sh, I get the source code"
COMMENT "from \"$cp_local_development_url\""
COMMENT "and put it into \"$cp_local_development_folder\"."

mkdir -p "$cp_local_development_folder"

IN_REPOSITORY

PACKAGE git

if [ -n "`ls`" ]
then
  SUBTITLE "Update existing repository"
  COMMENT "If you do not like updating, you can delete the folder \"$cp_local_development_folder\"."
  git checkout "$cp_local_development_branch"
  git pull "$cp_local_development_url"
else
  SUBTITLE "Download the source code"
  git clone --depth=1 "$cp_local_development_url" .
fi




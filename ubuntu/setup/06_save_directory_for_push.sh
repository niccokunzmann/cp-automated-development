#!/bin/bash

source `dirname $0`/config.sh

rm -rf $code_copy

mkdir -p $code_copy

# http://stackoverflow.com/a/4645159
cp "$directory"/. "$code_copy" -R

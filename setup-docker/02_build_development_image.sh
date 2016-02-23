#!/bin/bash
# This file builds the zen image

set -e

output_file="`pwd`/docker-zen-build-output.txt"

cd "`dirname \"$0\"`/.."

echo "Building Zen takes a long time. The output is redirected to \"$output_file\"."
2>&1 docker build -t coderdojo/cp-automated-development . | tee "$output_file"

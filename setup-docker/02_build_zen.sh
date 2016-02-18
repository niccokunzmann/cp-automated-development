#!/bin/bash
# This file builds the zen image

set -e

output_file="`pwd`/docker-zen-build-output.txt"

cd "`dirname \"$0\"`/.."

echo "Building Zen takes a long time. The output is redirected to \"$output_file\"."
2>&1 docker build -t zen . | tee "$output_file"
echo "Naming zen also coderdojo/zen to enable pushing."
docker tag zen coderdojo/zen
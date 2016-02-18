#!/bin/bash

if [ -z "$1" ]
then
  container_name="coderdojo/zen"
else
  container_name="$1"
fi

docker run -i -t "$container_name"
echo "Committing container named \"$container_name\"."
new_image=`docker commit --pause=true --message="$message" --author="$author <$email>" "$container_name" `
docker tag -f $new_image $container_name
docker tag -f $container_name coderdojo/$container_name
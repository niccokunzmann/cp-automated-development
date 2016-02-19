#!/bin/bash

if [ -z "$1" ]
then
  image_name="coderdojo/cp-automated-setup"
else
  image_name="$1"
fi

container_name="run-`echo \"$image_name\" | sed 's/[^a-zA-Z]/-/g'`"

echo "Use \"exit\" to save the changes."
echo "Use \"exit 1\" to discard the changes."
if docker run --interactive --tty --name "$container_name" "$image_name"
then
  echo "Committing container named \"$container_name\" to image \"$image_name\"."
  # --message="$message" --author="$author <$email>" 
  new_image="`docker commit --pause=true "$container_name" `"
  docker tag "$new_image" "$image_name"
fi


#!/bin/bash
# config
image_name="coderdojo/cp-automated-development"

# program
container_name="run-`echo \"$image_name\" | sed 's/[^a-zA-Z]/-/g'`"

docker rm "$container_name"

echo "Use \"exit\" to save the changes."
echo "Use \"exit 1\" to discard the changes."
if docker run --interactive --tty --name "$container_name" "$image_name" "$@"
then
  echo "Committing container named \"$container_name\" to image \"$image_name\"."
  # --message="$message" --author="$author <$email>" 
  new_image="`docker commit "$container_name" `" && \
  docker tag "$new_image" "$image_name"
fi

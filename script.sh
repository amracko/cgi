#!/bin/bash

if [ -z $1 ]; then
	echo "You didn't fill in the user directory"
	exit 1
fi
if [ -z $2 ]; then
        echo "You didn't fill in the image name"
        exit 1
fi

DOCKER_FILE_PATH="$1/Dockerfile"

# Compose Dockerfile
echo "FROM mrales/m-tree" > $DOCKER_FILE_PATH
echo "MAINTAINER mrales" >> $DOCKER_FILE_PATH

ls $1 | while read line; do echo "ADD $line"; done | grep -v "Dockerfile" >> $DOCKER_FILE_PATH

echo "CMD [\"start.sh\"]" >> $DOCKER_FILE_PATH

# Build image
docker build -t $2 .

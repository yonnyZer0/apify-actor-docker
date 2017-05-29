#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "Builds Docker images and publishes it with 'beta' tag"
    echo "Usage: ./build.sh <directory>"
    exit
fi

# fail on any error
set -e

DIR="$1"

docker build --no-cache --tag apify/actor-${DIR}:beta --tag apify/actor-${DIR}:latest ./${DIR}/

docker push apify/actor-${DIR}:beta

echo "Docker image was built and published as apify/actor-${DIR}:beta"
echo "Now test the image and then publish it with 'latest' tag by running:"
echo "  docker push apify/actor-${DIR}:latest"
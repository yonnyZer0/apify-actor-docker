#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "Builds a Docker image and publishes it with 'beta' tag"
    echo "Usage: ./build.sh <directory> [--cache]"
    echo ""
    echo "The --cache argument instructs build to use Docker layer cache."
    echo "Only use it if you know what you are doing!"
    exit
fi

# fail on any error
set -e

DIR="$1"

NO_CACHE=""
if [ "${2}" = "--cache" ]; then
  echo "WARNING: Using Docker layer cache, the resulting image might be outdated!"
else
  NO_CACHE="--no-cache"
fi

docker build --pull --tag apify/actor-${DIR}:beta --tag apify/actor-${DIR}:latest ${NO_CACHE} ./${DIR}/

# Test image locally
docker run apify/actor-${DIR}:beta

docker push apify/actor-${DIR}:beta

echo "Docker image was built and published as apify/actor-${DIR}:beta"
echo "Now test the image and then publish it with 'latest' tag by running:"
echo "  docker push apify/actor-${DIR}:latest"
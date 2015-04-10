#!/bin/bash

REPO=${REPO:-github.com/purpleworks/fleet-ui}

# Run the builder image to build fleet-ui docker image
echo building fleet-ui ...
docker rmi fleet-ui:latest > /dev/null 2>&1
docker run -t --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--env FLEET_VERSION=v0.9.1 \
	--env FLEETUIREPO=$REPO \
	--dns 8.8.8.8 \
	dockerage/fleet-ui-builder:latest

# Show the build result
docker images fleet-ui

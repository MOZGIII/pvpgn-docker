#!/bin/bash
set -ex

# Read positional arguments
TAG="$1"

# Set defaults
[[ -n "$TAG" ]] || TAG=latest

# Push base
docker push pvpgn/base

# Push git build
docker push pvpgn/git:$TAG

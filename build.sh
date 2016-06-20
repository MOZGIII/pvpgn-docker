#!/bin/bash
set -ex

# Read positional arguments
REPO="$1"

# Configure build options
if [[ -n "$REPO" ]]; then
  BUILD_ARGS="$BUILD_ARGS --build-arg REPO=$REPO"
fi

# Build base
docker build -t pvpgn/base pvpgn-docker-base

# Build latest version from git
docker build -t pvpgn/git $BUILD_ARGS pvpgn-docker-git

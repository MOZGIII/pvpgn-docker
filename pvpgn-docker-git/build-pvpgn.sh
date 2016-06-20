#!/bin/bash
set -ex

# create user
groupadd -r pvpgn --gid=999 && useradd -r -g pvpgn --uid=999 pvpgn

# prepare direcotries
mkdir -p /usr/src/pvpgn && chown pvpgn:pvpgn /usr/src/pvpgn

# clone sources
echo "Cloning from $REPO"
gosu pvpgn git clone "$REPO" /usr/src/pvpgn

# build
gosu pvpgn mkdir -p /usr/src/pvpgn/build
pushd /usr/src/pvpgn/build
gosu pvpgn cmake -D CMAKE_INSTALL_PREFIX=/usr/local/pvpgn -D WITH_MYSQL=true -D WITH_PGSQL=true -D WITH_LUA=true ../ && make

# install to priviledged location
make install

# free workdir
popd

# remove sources and build files
rm -rf /usr/src/pvpgn

# ensure server can write to required directories
chown -R pvpgn:pvpgn /usr/local/pvpgn/var

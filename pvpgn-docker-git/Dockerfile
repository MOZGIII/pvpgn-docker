FROM pvpgn/base

MAINTAINER MOZGIII <mike-n@narod.ru>

# set the args
ARG REPO=https://github.com/pvpgn/pvpgn-server.git

# create user
RUN groupadd -r pvpgn --gid=999 && useradd -r -g pvpgn --uid=999 pvpgn

# prepare direcotries
RUN mkdir -p /usr/src/pvpgn && chown pvpgn:pvpgn /usr/src/pvpgn

# drop permissions
USER pvpgn

# clone sources
RUN echo "Cloning from $REPO" && git clone "$REPO" /usr/src/pvpgn

# build
RUN mkdir -p /usr/src/pvpgn/build
WORKDIR /usr/src/pvpgn/build
RUN cmake -D CMAKE_INSTALL_PREFIX=/usr/local/pvpgn -D WITH_MYSQL=true -D WITH_PGSQL=true -D WITH_LUA=true ../ && make

# restore permissions
USER 0

# install to priviledged location
RUN make install

# free workdir
WORKDIR /

# remove sources and build files
RUN rm -rf /usr/src/pvpgn

# ensure server can write to required directories
RUN chown -R pvpgn:pvpgn /usr/local/pvpgn/var

# expose persisted data and configs to host
VOLUME /usr/local/pvpgn/var
VOLUME /usr/local/pvpgn/etc

# expose served network ports
EXPOSE 6112 6200

# drop privilidges again to run everything under unpriviledged user
USER pvpgn

# command to run the server
CMD ["/usr/local/pvpgn/sbin/bnetd", "-f"]

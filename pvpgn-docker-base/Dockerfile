FROM ubuntu:16.04

MAINTAINER MOZGIII <mike-n@narod.ru>

# install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    wget \
    git \
    ca-certificates \
    cmake \
    make \
    build-essential \
    zlib1g-dev \
    liblua5.1-0-dev \
    libmysqlclient-dev \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# grab gosu, su and sudo alternative
ENV GOSU_VERSION 1.7
RUN set -x \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

# make the "en_US.UTF-8" locale
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

FROM pvpgn/base

MAINTAINER MOZGIII <mike-n@narod.ru>

# set the args
ARG REPO=https://github.com/pvpgn/pvpgn-server.git

# add and run build script
COPY build-pvpgn.sh /root/
RUN /bin/bash /root/build-pvpgn.sh

# expose persisted data and configs to host
VOLUME /usr/local/pvpgn/var
VOLUME /usr/local/pvpgn/etc

# expose served network ports
EXPOSE 6112 6200

# drop privilidges again to run everything under unpriviledged user
USER pvpgn

# command to run the server
CMD ["/usr/local/pvpgn/sbin/bnetd", "-f"]

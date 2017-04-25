FROM resin/raspberry-pi3-debian:jessie

RUN echo "deb-src http://ftp.debian.org/debian jessie-backports main" >>  /etc/apt/sources.list \
&& apt-get update && apt-get install devscripts \
&& apt-get install -t jessie-backports  ola

COPY ola-config/ /etc/ola/

EXPOSE 9090/tcp 6454/tcp 6454/udp

CMD  bash

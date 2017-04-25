FROM resin/raspberry-pi3-debian:jessie

RUN echo "deb-src http://ftp.debian.org/debian jessie-backports main" >>  /etc/apt/sources.list \
&& apt-get update && apt-get install devscripts \
&& apt-get build-dep ola

RUN adduser --disabled-password --gecos "" olad \
&& sudo -u olad apt-get -b source ola \
&& sudo debi

COPY ola-config/ /etc/ola/

EXPOSE 9090/tcp 6454/tcp 6454/udp

CMD  bash

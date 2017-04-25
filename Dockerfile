FROM resin/raspberry-pi3-debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >>  /etc/apt/sources.list \
		&& apt-get update \
		&& apt-get install -t jessie-backports -y  ola \
		&& cat /etc/init.d/olad | sed "s/--log-level/-p 8080 --log-level/g" > /etc/init.d/olad \
		&& /etc/init.d/olad start

COPY ola-config/ /etc/ola/

EXPOSE 8080/tcp 6454/tcp 6454/udp

CMD  bash

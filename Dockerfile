FROM resin/raspberry-pi3-debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >>  /etc/apt/sources.list \
		&& apt-get update \
		&& apt-get install -t jessie-backports -y  ola \
		&& cat /etc/init.d/olad | sed "s/--log-level/-p 80 --log-level/g" > /etc/init.d/olad.tmp \
		&& mv /etc/init.d/olad /etc/init.d/olad.backup \
		&& mv /etc/init.d/olad.tmp /etc/init.d/olad \
		&& chmod +x /etc/init.d/olad \
		&& setcap 'cap_net_bind_service=+ep' /usr/bin/olad \
		&& /etc/init.d/olad start

COPY ola-config/ /etc/ola/

EXPOSE 80/tcp 6454/tcp 6454/udp

CMD  bash

FROM resin/raspberry-pi3-debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >>  /etc/apt/sources.list \
		&& apt-get update \
		&& apt-get install -y apt-utils iptables \
		&& apt-get install -t jessie-backports -y  ola

RUN iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 9090

COPY ola-config/ /etc/ola/

EXPOSE 9090/tcp 6454/tcp 6454/udp

CMD  bash

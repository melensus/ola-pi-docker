FROM resin/raspberry-pi3-debian:jessie

COPY ola-config/ /var/lib/ola/conf/

RUN apt-get update && apt-get install -y ola

EXPOSE 9090/tcp 6454/tcp 6454/udp 22/tcp

CMD /etc/init.d/olad start && bash

FROM resin/raspberry-pi3-debian:jessie

COPY ola-config/ /etc/ola/

RUN apt-get update && apt-get install -y ola

EXPOSE 9090/tcp 6454/tcp 6454/udp

CMD /etc/init.d/olad start && chown root.olad /dev/spi* && chmod 660 /dev/spi* && /etc/init.d/olad restart && bash

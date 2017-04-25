FROM resin/raspberry-pi3-debian:jessie

COPY ola-config/ /etc/ola/

RUN apt-get update && apt-get install -y ola

EXPOSE 9090/tcp 6454/tcp 6454/udp

CMD  bash

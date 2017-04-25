FROM resin/raspberry-pi3-debian:jessie

RUN apt-get update && apt-get install -y ola

EXPOSE 9090
EXPOSE 6454
EXPOSE 6454/udp

COMMAND olad

FROM resin/raspberry-pi3-debian:jessie

RUN apt-get update && apt-get install -y ola

EXPOSE 9090/tcp 6454/tcp 6454/udp

CMD olad

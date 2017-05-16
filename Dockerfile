#
# Dockerfile for cpuminer
# usage: docker run <image name> --url xxxx --user xxxx --pass xxxx
# ex: docker run <image name> --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#
#

FROM gcc

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN \
  ./autogen.sh && \
  ./configure CFLAGS="-O3" && \
  make && \
  make install

ENTRYPOINT ["./minerd"]

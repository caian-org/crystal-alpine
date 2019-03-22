FROM alpine:3.9.2 AS base
MAINTAINER Caian R. Ertl <hi@caian.org>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add build-base libc-dev \
        zlib-dev openssl-dev readline-dev gmp-dev yaml-dev libxml2-dev \
        'crystal=0.27.2-r0' 'shards=0.8.1-r0'

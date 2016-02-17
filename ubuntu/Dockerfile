FROM ubuntu:15.10

RUN mkdir -p /user/src/app/
WORKDIR /user/src/app/

# postgres access
#   http://docs.docker.com/engine/reference/builder/#env
#   https://github.com/niccokunzmann/cp-local-development/blob/master/init.js#L74
ENV POSTGRES_USERNAME=platform
ENV POSTGRES_PASSWORD=QdYx3D5y
ENV POSTGRES_HOST=postgres-zen
ENV POSTGRES_PORT=5432

ADD setup setup

RUN chmod +x setup/*.sh

RUN apt-get -qq update

VOLUME /user/src/app/cp-local-development

FROM ubuntu:15.10

RUN mkdir -p /user/src/app/
WORKDIR /user/src/app/

ADD scripts scripts
RUN chmod +x scripts/*.sh

ADD docker docker
RUN chmod +x docker/*.sh


RUN apt-get -qq update

VOLUME /user/src/app/cp-local-development

WORKDIR /user/src/app/scripts

RUN ./install.sh

WORKDIR /user/src/app/cp-local-development
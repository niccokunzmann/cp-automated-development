FROM ubuntu:15.10

# update the system

RUN apt-get -qq update && \
    apt-get -qq -y install sudo && \
    apt-get -qq autoremove && \
    apt-get -qq clean

# set variables

env setup_user zen
env setup_home "/home/$setup_user"

# create user and home

RUN mkdir -p "$setup_home" && \
    useradd "$setup_user" && \
    chown "$setup_user:$setup_user" "$setup_home"

WORKDIR "$setup_home"

# adding files

ADD setup-zen setup
ADD docker-home .

# create volumes

VOLUME "$setup_home/cp-local-development"

# install

# RUN ./install.sh

# prepare for bashing

WORKDIR "$setup_home"

CMD /usr/bin/sudo -u "$setup_user" "$setup_home/.start.sh"
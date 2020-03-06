FROM ubuntu:18.04

# Set the locale
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y locales \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8 
ENV LC_ALL en_US.UTF-8

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git vim python3 python3-pip python3-dev \
    libssl-dev libffi-dev build-essential \
    apt-utils tmux

# pwntools
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev

# pwndbg

#RUN echo 'set auto-load safe-path /' >> /root/.gdbinit

RUN git clone https://github.com/pwndbg/pwndbg /pwndbg
WORKDIR /pwndbg
RUN ./setup.sh

WORKDIR /

CMD ["/bin/bash"]

FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y git python python3 wget vim gdb locales tmux \
	python2.7 python-pip python-dev git libssl-dev libffi-dev \
	build-essential

RUN pip install --upgrade pip 
RUN pip install --upgrade pwntools

RUN echo 'set auto-load safe-path /' >> /root/.gdbinit

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

ADD https://api.github.com/repos/pwndbg/pwndbg/git/refs/heads/dev version.json
RUN git clone https://github.com/pwndbg/pwndbg /pwndbg
WORKDIR /pwndbg
RUN ./setup.sh
WORKDIR /

CMD ["/bin/bash"]

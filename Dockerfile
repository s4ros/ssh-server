FROM ubuntu:18.04

RUN apt update && \
	apt upgrade -y -q && \
	mkdir /run/sshd && \
	apt install vim sudo rsync python3 python3-pip -y -q

RUN apt install openssh-server -y -q
COPY . /data
WORKDIR /data
CMD /usr/sbin/sshd -D

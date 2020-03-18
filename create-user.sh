#!/bin/bash
USER=$1
PASSWD=$2

set -x

if [[ $# -lt 2 ]]; then
	echo "Usage $0 <user> <passwd>"
	exit 1
fi

adduser --disabled-password --gecos ${USER} --shell /bin/bash --home /home/${USER} ${USER}
usermod --password $(echo ${PASSWD} | openssl passwd -1 -stdin) $USER
echo "${USER} ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER}

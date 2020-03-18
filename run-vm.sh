#!/bin/bash

docker build -t s4ros/ubuntu-ssh .

if [[ $# -lt 1 ]]; then
	echo "Usage $0 <port> [username] [user_password]"
	exit 1
fi

PORT=${1:-6222}
NAME=${2:-custom_instance}
PASSWD=${3:-dupa123}
docker run --rm --name ssh_${NAME} -d -p $PORT:22 s4ros/ubuntu-ssh
docker exec ssh_${NAME} ./create-user.sh ${NAME} ${PASSWD}

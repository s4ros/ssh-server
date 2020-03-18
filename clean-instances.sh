#!/bin/bash

set -x

IMAGE=s4ros/ubuntu-ssh
CONTAINERS=$(docker ps | grep ssh_ | awk '{print $1}')

docker kill ${CONTAINERS}
#docker rm ${CONTAINERS}

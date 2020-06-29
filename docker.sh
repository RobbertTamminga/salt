#!/bin/bash

if ! command -v docker;
    then
    apt-get update
    apt -y install docker.io
    systemctl start docker
    systemctl enable docker
else
    echo "F"
fi
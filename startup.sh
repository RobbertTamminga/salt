#!/bin/bash

if [! saltstack];
    then
        curl -L https://bootstrap.saltstack.com -o install_salt.sh
        sudo sh install_salt.sh
        echo "master: 10.0.0.28" > /etc/salt/minion.conf
fi
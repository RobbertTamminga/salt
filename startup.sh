#!/bin/bash

if ! command -v salt;
    then
        curl -L https://bootstrap.saltstack.com -o install_salt.sh
        sudo sh install_salt.sh
        if ! grep -Fxq "master: 10.0.0.28" "/etc/salt/minion";
            then
                echo "master: 10.0.0.28" >> /etc/salt/minion
                sudo systemctl restart salt-minion
        fi
else
    echo "F"
fi
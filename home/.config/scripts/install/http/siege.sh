#!/bin/bash

source /etc/os-release

if [ "${ID}" = "debian" ] | [ "${ID}" = "ubuntu" ]; then
    sudo apt install -y siege
elif [ "${ID}" = "redhat" ] | [ "${ID}" = "fedora" ] | [ "${ID}" = "rocky" ] | [ "${ID}" = "rhel" ]; then
    sudo yum install -y siege
fi
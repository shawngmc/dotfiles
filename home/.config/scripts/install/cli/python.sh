#!/bin/bash

source /etc/os-release
PACKAGES=()

# Python 3
if [ -f $(which python3) ]; then
    echo "Python3 already installed..."
    python3 --version

    # Pip
    python3 -m pip -V
    if  [ $? -eq 0 ]; then
        echo "Pip already installed..."
    else
        PACKAGES+=("python3-pip")
    fi

    # Pipx
    which pipx
    if [ $? -eq 0 ]; then
        echo "Pipx already installed..."
        pipx --version
    else
        # TODO: Block out for old RHEL7/8
        PACKAGES+=("pipx")
    fi

    # Powerline
    which powerline-daemon
    if [ $? -eq 0 ]; then
        echo "Powerline already installed..."
        powerline-daemon -V
    else
        PACKAGES+=("powerline")
    fi
else
    PACKAGES+=("python3")
    PACKAGES+=("python3-pip")
    PACKAGES+=("pipx")
    PACKAGES+=("powerline")
fi

if [ "${ID}" = "debian" ] | [ "${ID}" = "ubuntu" ]; then
    sudo apt install -y ${PACKAGES[@]}
elif [ "${ID}" = "redhat" ] | [ "${ID}" = "fedora" ] | [ "${ID}" = "rocky" ] | [ "${ID}" = "rhel" ]; then
    sudo yum install -y ${PACKAGES[@]}
fi

# Upgrade pip
python3 -m pip install --user --upgrade pip

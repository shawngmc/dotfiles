#!/bin/bash

source /etc/os-release
PACKAGES=()

# Python 3
if [ -f $(which python3) ]; then
    HAS_PYTHON=true
    echo "Python3 already installed..."
    python3 --version
else
    HAS_PYTHON=false
    PACKAGES+=("python3")
fi

# Pip
if [ $HAS_PYTHON -eq 0 ] & [ -f $(python3 -m pip) ]; then
    echo "Pip already installed..."
    python3 -m pip -V
else
    PACKAGES+=("python3-pip")
fi

# Pipx
if [ $HAS_PYTHON -eq 0 ] & [ -f $(which pipx) ]; then
    echo "Pipx already installed..."
    pipx -V
else
    # TODO: Block out for old RHEL7/8
    PACKAGES+=("pipx")
fi

# Powerline
if [ $HAS_PYTHON -eq 0 ] & [ -f $(which powerline-daemon) ]; then
    echo "Powerline already installed..."
    powerline-daemon -V
else
    PACKAGES+=("powerline")
fi

if [ "${ID}" = "debian" ] | [ "${ID}" = "ubuntu" ]; then
    sudo apt install -y ${PACKAGES[@]}
elif [ "${ID}" = "redhat" ] | [ "${ID}" = "fedora" ] | [ "${ID}" = "rocky" ] | [ "${ID}" = "rhel" ]; then
    sudo yum install -y ${PACKAGES[@]}
fi
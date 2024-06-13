#!/bin/bash

source /etc/os-release

echo "Adding .bashrc.d to .bashrc..."
cat << EOF >> /tmp/debian-contrib-nonfree.list
deb https://deb.debian.org/debian ${VERSION_CODENAME} contrib non-free non-free-firmware
deb https://deb.debian.org/debian ${VERSION_CODENAME}-updates contrib non-free non-free-firmware
deb https://deb.debian.org/debian-security/ ${VERSION_CODENAME}-security contrib non-free non-free-firmware
EOF

sudo mv /tmp/debian-contrib-nonfree.list /etc/apt/sources.list.d/debian-contrib-nonfree.list
sudo apt-get update

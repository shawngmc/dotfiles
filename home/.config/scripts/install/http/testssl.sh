#!/bin/bash

VERSION="3.0.8"
TARBALL="testssl.sh-${VERSION}.tar.gz"
curl -LJO "https://testssl.sh/${TARBALL}"

mkdir -pv ~/.local/apps/testssl
mkdir -pv ~/.local/bin

tar -xvf ${TARBALL} --strip-components 1 -C ~/.local/apps/testssl

ln -s ~/.local/apps/testssl/testssl.sh ~/.local/bin/testssl 
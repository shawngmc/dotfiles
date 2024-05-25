#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing vlc from package repo...";
install_os_package vlc;

#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing tor browser..."
install_os_package torbrowser-launcher;

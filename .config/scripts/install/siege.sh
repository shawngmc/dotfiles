#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing siege from package repo...";
install_os_package siege;

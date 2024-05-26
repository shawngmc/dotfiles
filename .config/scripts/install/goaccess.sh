#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing goaccess..."
if (( $(is_airgapped) == 1 )); then
  brew install goaccess;
else
  install_os_package goaccess;
fi

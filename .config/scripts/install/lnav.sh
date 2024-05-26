#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing lnav..."
if (( $(is_airgapped) == 1 )); then
  brew install lnav;
else
  install_os_package lnav;
fi

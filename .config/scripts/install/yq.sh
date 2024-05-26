#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing yq..."
if (( $(is_airgapped) == 1 )); then
  brew install yq;
else
  install_os_package yq;
fi

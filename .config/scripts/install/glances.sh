#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing glances..."
if (( $(is_airgapped) == 1 )); then
  brew install glances;
else
  install_os_package glances;
fi

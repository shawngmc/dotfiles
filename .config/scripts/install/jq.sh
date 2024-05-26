#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

if (( $(is_airgapped) == 1 )); then
  brew install jq;
else
  echo "Installing older version from package repo...";
  install_os_package jq;
fi

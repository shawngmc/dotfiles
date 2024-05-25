#!/bin/bash

source ../util/helper.sh

if (( is_airgapped = 1 )); then
  # Pull from the internet and install in ~/.local
else
  echo "Installing older version from package repo...";
  install_package PACKAGE_NAME;
fi

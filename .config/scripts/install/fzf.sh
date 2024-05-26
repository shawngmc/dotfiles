#!/bin/bash

source $(dirname $0)/../util/helper.sh

if (( is_airgapped = 1 )); then
  brew install fzf;
else
  echo "Installing older version from package repo...";
  install_package fzf;
fi

#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing dasel..."
if (( $(is_airgapped) == 1 )); then
  brew install dasel;
else
  echo "VSCode isn't in package repos...";
  exit 1;
fi

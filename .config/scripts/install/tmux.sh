#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing tmux..."
if (( $(is_airgapped) == 1 )); then
  brew install tmux;
else
  install_os_package tmux;
fi

#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

if (( is_airgapped = 1 )); then
  echo "Installing powerline via Pip/Git to get latest version..."
  if (( $(support_conda) == 0 )); then
    activate_default_conda;
  fi
  python3 -m pip install --user git+https://github.com/powerline/powerline.git@develop
else
  echo "Installing older version from package repo...";
  install_package powerline;
fi

# Activate powerline in this env
source ~/.bashrc.d/140_powerline.sh

echo "Restarting the daemon..."
powerline-daemon --replace

echo "Powerline should appear in all new shells."

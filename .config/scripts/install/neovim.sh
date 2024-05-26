#!/bin/bash

source ../util/helper.sh

if (( is_airgapped = 1 )); then
  brew install neovim;
else
  echo "Installing older version from package repo...";
  install_package neovim;
fi

# Symlink as default editor
sudo alternatives --install /usr/bin/editor nvim /bin/nvim 1

# Install Python provider support
if (( support_conda = 0 )); then
  activate_default_conda;
fi
python3 -m pip install --user --upgrade pynvim

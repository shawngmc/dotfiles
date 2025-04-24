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

# Install vim plugins
install_package vim-airline;
install_package vim-fugitive;

# Install ShellCheck, which is stupidly case-sensitive
DETECTED_PACKAGE_MANAGER=$(detect_package_manager);
  case "${DETECTED_PACKAGE_MANAGER}" in
    apt)
      sudo apt install -y shellcheck;
      ;;

    dnf)
      sudo dnf install -y ShellCheck;
      ;;

    *)
      echo "Unclear how package manager ${DETECTED_PACKAGE_MANAGER} works, but I don't handle it yet..." >&2;
      exit 1;
      ;;
  esac

#!/bin/bash

source ../util/helper.sh

echo "Installing conda..."
if (( is_airgapped = 1 )); then
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -rf ~/miniconda3/miniconda.sh
else
  echo "Installing older version from package repo...";
  install_package conda;
fi

echo "Initializing conda..."
~/miniconda3/bin/conda init bash

#!/bin/bash

source /etc/os-release

# Have to save pull from GH to protect newlines
curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" -o ./neovim_latest.json 
NEOVIM_TAG=$(cat ./neovim_latest.json | grep tag_name)
NEOVIM_TAG=${NEOVIM_TAG:15:-2}
echo "Pulling Neovim tag: ${NEOVIM_TAG}"

NEOVIM_LATEST_URL=$(cat ./neovim_latest.json | jq -r '.assets[] | select(.name == "nvim-linux64.tar.gz") | .browser_download_url')
rm ./neovim_latest.json
curl -LJO $NEOVIM_LATEST_URL
mkdir -pv ~/.local/apps/nvim
mkdir -pv ~/.local/bin
tar -xvf nvim-linux64.tar.gz -C ~/.local/apps/nvim --strip-components 1
rm nvim-linux64.tar.gz
ln -s ~/.local/apps/nvim/bin/nvim ~/.local/bin/nvim

# Install Python provider support
python3 -m pip install --user --upgrade pynvim
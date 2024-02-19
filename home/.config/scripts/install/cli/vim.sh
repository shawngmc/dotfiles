#!/bin/bash

source /etc/os-release
PACKAGES=()

# Have to save pull from GH to protect newlines
curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" -o ./jq_latest.json 
NEOVIM_TAG=$(cat ./neovim_latest.json | grep tag-name)
NEOVIM_TAG=${NEOVIM_TAG:15:-2}
echo "Pulling JQ tag: ${NEOVIM_TAG}"

NEOVIM_LATEST_URL=$(cat ./neovim_latest.json | grep browser_download_url | grep nvim-linux64.tar.gz)
NEOVIM_LATEST_URL=${NEOVIM_LATEST_URL:31:-1}
rm ./neovim_latest.json
echo $NEOVIM_LATEST_URL
curl -LJO $NEOVIM_LATEST_URL
mkdir -pv ~/.local/bin
tar -xvf nvim-linux64.tar.gz -C ~/.local/ --strip-components 1

# Install Python provider support
python3 -m pip install --user --upgrade pynvim
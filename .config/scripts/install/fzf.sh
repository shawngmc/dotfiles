#!/bin/bash

source ../util/helper.sh

if (( is_airgapped = 1 )); then
  if (( does_cli_tool_exist jq == 1 )); then
    echo "JQ is required to install FZF from repo..." >&2;
    exit 1
  fi
  FZF_LATEST=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest")
  FZF_TAG=$(echo $FZF_LATEST | jq -r '."tag_name"')
  echo "Pulling FZF tag: ${FZF_TAG}"
  
  FZF_LATEST_URL=$(echo $FZF_LATEST | jq -r '.tarball_url')
  curl -LJ $FZF_LATEST_URL -o ./fzf.tar.gz
  mkdir ~/.fzf/
  tar -xvf ./fzf.tar.gz --strip-components 1 -C ~/.fzf/
  rm ./fzf.tar.gz
  ~/.fzf/install --all
else
  echo "Installing older version from package repo...";
  install_package fzf;
fi

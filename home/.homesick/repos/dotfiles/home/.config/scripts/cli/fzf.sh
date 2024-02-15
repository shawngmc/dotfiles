#!/bin/bash


FZF_LATEST=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest")
FZF_TAG=$(echo $FZF_LATEST | jq -r '."tag_name"')
echo "Pulling FZF tag: ${FZF_TAG}"

FZF_LATEST_URL=$(echo $FZF_LATEST | jq -r '.tarball_url')
curl -LJ $FZF_LATEST_URL -o ./fzf.tar.gz
mkdir ~/.fzf/
tar -xvf ./fzf.tar.gz --strip-components 1 -C ~/.fzf/
rm ./fzf.tar.gz
~/.fzf/install --all

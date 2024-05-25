#!/bin/bash

source ../util/helper.sh

echo "Installing conda..."
if (( is_airgapped = 1 )); then
  curl -LJ "https://gist.github.com/reegnz/b9e40993d410b75c2d866441add2cb55/raw/jq-repl" -o ~/.local/bin/jq-repl
  chmod +x ~/.local/bin/jq-repl
else
  echo "No jq-repl in any package repo...";
  exit 1;
fi

#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing vscode..."
if (( $(is_airgapped) == 1 )); then
  # I need to pull the latest TOR BROWSER package, not tor from the debian tor repo
  # This is on https://www.torproject.org/download/
  # Regex to capture version number: /\/dist\/torbrowser\/([\.\d]+)\/tor-browser-linux-x86_64-/g
  # I might also be able to use the directory listing at https://dist.torproject.org/torbrowser/
  # Or the update JSON from https://aus1.torproject.org/torbrowser/update_3/release/downloads.json, but it appears to be out of date...
  URL_FRAG=$(wget -qO- https://torproject.org/download | grep -oP '(?<=href=")[^"]*(?=")' | grep -P '^/dist/torbrowser/([\.\d]+)/tor-browser-linux-x86_64-([\.\d]+).tar.xz' | head -n 1)
  echo $URL_FRAG
else
  echo "Tor in package repos is too old...";
  exit 1;
fi

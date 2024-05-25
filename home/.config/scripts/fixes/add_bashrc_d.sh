#!/bin/bash

echo "Adding a .bashrc.d folder..."
mkdir -p ~/.bashrc.d/

echo "Adding .bashrc.d to .bashrc..."
cat << 'EOF' >> ~/.bashrc
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
EOF

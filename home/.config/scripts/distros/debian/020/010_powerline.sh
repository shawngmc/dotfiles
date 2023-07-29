#!/bin/bash

echo "Installing powerline..."
sudo apt install powerline

echo "Configuring .bashrc..."
cat <<-"EOF1" > $HOME/.bashrc.append
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. {repository_root}/powerline/bindings/bash/powerline.sh
EOF1
if ! grep -F -q -f $HOME/.bashrc{.append,}; then
    cat $HOME/.bashrc.append >> $HOME/.bashrc
fi

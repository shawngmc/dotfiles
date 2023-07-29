#!/bin/bash

echo "Installing powerline..."
sudo apt install powerline

echo "Configuring .bashrc..."
cat >> $HOME/.bashrc <<'EOF'
STATUS="$(systemctl is-active powerline-daemon.service --user)"
if [ "${STATUS}" != "active" ]; then
    systemctl start powerline-daemon.service --user
fi
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
EOF

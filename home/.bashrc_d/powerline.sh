#!/bin/bash

# If installed, run powerline
if [ -f "/usr/share/powerline/bindings/bash/powerline.sh" ]; then
  POWERLINE_PATH="/usr/share/powerline/bindings/bash/powerline.sh"
elif [ -f "/usr/share/powerline/bash/powerline.sh" ]; then
  POWERLINE_PATH="/usr/share/powerline/bash/powerline.sh"
fi
if [ ! -z "$POWERLINE_PATH" ]; then
  # See if powerline daemon is a systemd service
  systemctl list-unit-files foo.service &>/dev/null
  if [ $? -eq 0 ]; then
    STATUS="$(systemctl is-active powerline-daemon.service --user)"
    if [ "${STATUS}" != "active" ]; then
      systemctl start powerline-daemon.service --user
    fi
  elif [ -f $(which powerline-daemon) ]; then
    powerline-daemon -q &
  fi
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . $POWERLINE_PATH
fi
#!/bin/bash

# Set window title to path when changing directories
set-window-title() {
  echo -en "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
}
if [[ "$PROMPT_COMMAND" ]]; then
  export PROMPT_COMMAND="$PROMPT_COMMAND;set-window-title"
else
  export PROMPT_COMMAND=set-window-title
fi

# If installed, run powerline
if [ -f "/usr/share/powerline/bindings/bash/powerline.sh" ]; then
  STATUS="$(systemctl is-active powerline-daemon.service --user)"
  if [ "${STATUS}" != "active" ]; then
      systemctl start powerline-daemon.service --user
  fi
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi

# Source a .bashrc.local, if it exists
if [ -f "~/.bashrc.local" ]; then
  . ~/.bashrc.local
fi

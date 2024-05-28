#!/bin/bash

# Current issues:
# - First launch isn't fullscreen
# - If we get to two actual copies of kitty with that class, wmctrl and xdotool get confused
# - If another window takes focus, need to use keycombo twice, since it's not withdrawn... track focus instead?


KITTY_DESKTOP_CLASS="kitty-desktop-mode"
KITTY_SOCKET="unix://$HOME/kittydesktop"

###########################################

# See if a kitty desktop mode window exists
KITTY_XWIN=$(xdotool search --class "${KITTY_DESKTOP_CLASS}")
KITTY_DESKTOP_RUNNING=$?

# If kitty desktop mode isn't running, start it
if ((KITTY_DESKTOP_RUNNING == 1)); then
  kitty -o allow_remote_control=socket-only --listen-on "${KITTY_SOCKET}" --session ~/.config/scripts/customization/kitty-desktop.session &
  sleep 3
  wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b add,hidden
  # xdotool search --class "${KITTY_DESKTOP_CLASS}" windowunmap
  KITTY_XWIN=$(xdotool search --class "${KITTY_DESKTOP_CLASS}")
fi

# Get the current state
echo "1${KITTY_XWIN}2"
xprop -id ${KITTY_XWIN} | grep 'window state: Withdrawn'
KITTY_HIDDEN=$?

# Toggle things
if ((KITTY_HIDDEN == true)); then
  #xdotool search --class "${KITTY_DESKTOP_CLASS}" windowmap
  wmctrl -x -r "${KITTY_DEKSTOP_CLASS}" -b remove,hidden
  wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b add,fullscreen
else
  wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b remove,fullscreen
  wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b add,hidden
  #xdotool search --class "${KITTY_DESKTOP_CLASS}" windowunmap
fi

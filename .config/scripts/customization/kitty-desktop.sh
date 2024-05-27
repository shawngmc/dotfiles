#!/bin/bash

# Current issues:
# - First launch isn't fullscreen
# - If we get to two actual copies of kitty with that class, wmctrl and xdotool get confused
# - If another window takes focus, need to use keycombo twice, since it's not withdrawn... track focus instead?


KITTY_DESKTOP_CLASS="kitty-desktop-mode"
KITTY_SOCKET="unix://tmp/kittydesktop"

###########################################

# See if a kitty desktop mode window exists
xdotool search --class "${KITTY_DESKTOP_CLASS}"
KITTY_DESKTOP_RUNNING=$?

# If kitty desktop mode isn't running, start it
if ((KITTY_DESKTOP_RUNNING == 1)); then 
  kitty -o allow_remote_control=yes --listen-on "${KITTY_SOCKET}" --class "${KITTY_DESKTOP_CLASS}"
  xdotool search --class "${KITTY_DESKTOP_CLASS}" windowunmap
  sleep 1
fi

# Get the current state
xprop -id $(xdotool search --class "${KITTY_DESKTOP_CLASS}") | grep 'window state: Withdrawn'
KITTY_HIDDEN=$?

# Toggle things
if ((KITTY_HIDDEN == true)); then 
  xdotool search --class "${KITTY_DESKTOP_CLASS}" windowmap 
  wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b add,fullscreen
else
  wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b remove,fullscreen
  xdotool search --class "${KITTY_DESKTOP_CLASS}" windowunmap 
fi

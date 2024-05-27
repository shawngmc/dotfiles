#!/bin/bash

KITTY_DESKTOP_CLASS="kitty-desktop-mode"
KITTY_SOCKET="unix://tmp/kittydesktop"

###########################################

# See if a kitty desktop mode window exists
xdotool search --class "${KITTY_DESKTOP_CLASS}"
KITTY_DESKTOP_RUNNING=$?

# If kitty desktop mode isn't running, start it
if ((KITTY_DESKTOP_RUNNING == 1)); then 
    kitty -o allow_remote_control=yes --listen-on "${KITTY_SOCKET}" --class "${KITTY_DESKTOP_CLASS}"
    wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b add,hidden
    wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b remove,fullscreen
    sleep 2
fi

# Toggle things
wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b toggle,hidden
wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b toggle,fullscreen
wmctrl -x -r "${KITTY_DESKTOP_CLASS}" -b add,skip_taskbar

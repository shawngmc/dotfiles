#!/bin/bash


echo "Screen Cap area via Super-Shift-S"
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/<Shift><Super>s -s "xfce4-screenshooter"

echo "Dark Theme"
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-Dark"
xfconf-query -c xfwm4 -p /general/theme -s "Default"

echo "Show Desktop via Super-D"
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/<Super>d -s "show_desktop_key"

echo "Default:"
echo "- Enable Taskbar Window Grouping (eg Win 8/10)"
echo "- Run Dialog via Super-R"

echo "NYI:"
echo "- Terminal: Show running app titles"
echo "- Enable Aero Snap-style window tiling"
echo "  - Side-by-side via Super+Left/Right"
echo "  - Maximize via Super+Up"
echo "  - De-Maximize via Super+Down"

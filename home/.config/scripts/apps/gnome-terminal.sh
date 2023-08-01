#!/bin/bash

echo "Next Tab: Ctrl-Tab"
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
echo "Previous Tab: Ctrl-Shift-Tab"
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'

echo "Default:"
echo "- New Tab: Ctrl-Shift-T"

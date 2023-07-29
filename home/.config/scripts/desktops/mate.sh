#!/bin/bash

# Win 10-ish Window Grouping
dconf write /org/mate/panel/objects/window-list/prefs/group-windows "'always'"

# Dark theme
gsettings set org.mate.interface gtk-theme Adwaita-dark

# Terminal Titles
dconf write /org/mate/terminal/profiles/default/title-mode "'replace'"

# Enable side-by-side tiling and Win-Left/Right
dconf write /org/mate/marco/general/side-by-side-tiling true
dconf write /org/mate/marco/window-keybindings/tile-to-side-e "'<Mod4>Right'"
dconf write /org/mate/marco/window-keybindings/tile-to-side-w "'<Mod4>Left'"
dconf write /org/mate/marco/window-keybindings/maximize "'<Mod4>Up'"
dconf write /org/mate/marco/window-keybindings/unmaximize "'<Mod4>Down'"

# Win-R open run dialog
dconf write /org/mate/marco/global-keybindings/panel-run-dialog "'<Mod4>R'"

# Win-D Show Desktop
dconf write /org/mate/marco/global-keybindings/show-desktop "'<Mod4>D'"

# TODO: Win-Shift-S or similar screenshot

#!/bin/bash

echo "Enable Taskbar Window Grouping (eg Win 8/10)"
dconf write /org/mate/panel/objects/window-list/prefs/group-windows "'always'"

echo "Dark Theme"
gsettings set org.mate.interface gtk-theme Adwaita-dark

echo "Terminal: Show running app titles"
dconf write /org/mate/terminal/profiles/default/title-mode "'replace'"

echo "Enable Aero Snap-style window tiling"
echo "  - Side-by-side via Super+Left/Right"
echo "  - Maximize via Super+Up"
echo "  - De-Maximize via Super+Down"
dconf write /org/mate/marco/general/side-by-side-tiling true
dconf write /org/mate/marco/window-keybindings/tile-to-side-e "'<Mod4>Right'"
dconf write /org/mate/marco/window-keybindings/tile-to-side-w "'<Mod4>Left'"
dconf write /org/mate/marco/window-keybindings/maximize "'<Mod4>Up'"
dconf write /org/mate/marco/window-keybindings/unmaximize "'<Mod4>Down'"

echo "Run Dialog via Super-R"
dconf write /org/mate/marco/global-keybindings/panel-run-dialog "'<Mod4>R'"

echo "Show Desktop via Super-D"
dconf write /org/mate/marco/global-keybindings/show-desktop "'<Mod4>D'"

echo "NYI:"
echo "- Screen Cap area via Super-Shift-S"

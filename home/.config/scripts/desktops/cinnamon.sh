#!/bin/bash

echo "Dark Theme"
dconf write /org/cinnamon/theme/name "'BlackMATE'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Adwaita-dark'"

echo "Default:"
echo "- Enable Aero Snap-style window tiling"
echo "  - Side-by-side via Super+Left/Right"
echo "  - Maximize via Super+Up"
echo "  - De-Maximize via Super+Down"
echo "- Show Desktop via Super-D"
echo "- Enable Taskbar Window Grouping (eg Win 8/10)"

echo "NYI:"
echo "- Screen Cap area via Super-Shift-S"
echo "- Run Dialog via Super-R"
echo "- Terminal: Show running app titles"

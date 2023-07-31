#!/bin/bash

echo "Dark Theme"
lookandfeeltool -a org.kde.breezedark.desktop

echo "Screen Cap area via Super-Shift-S"
kwriteconfig5 --file kglobalshortcutsrc --group org.kde.spectacle.desktop --key "RectangularRegionScreenShot"  "Meta+Shift+Print\tMeta+Shift+S,Meta+Shift+Print,Capture Region"
# Fix \\t to \t
sed -i '/RectangularRegionScreenShot/s/\\\\t/\\t/g' ~/.config/kglobalshortcutsrc

echo "Run Dialog via Super-R"
kwriteconfig5 --file kglobalshortcutsrc --group org.kde.krunner.desktop --key "_launch"  "Alt+Space\tSearch\tMeta+R\tAlt+F2,Alt+Space\tSearch\tAlt+F2,KRunner"
# Fix \\t to \t
sed -i '/_launch/s/\\\\t/\\t/g' ~/.config/kglobalshortcutsrc


# Apply KDE config changes (kglobalshortcutsrc, etc.)
kquitapp5 kglobalaccel && sleep 2s && kglobalaccel5 &





echo "- Terminal: Show running app titles"


echo "Default:"
echo "- Enable Aero Snap-style window tiling"
echo "  - Side-by-side via Super+Left/Right"
echo "  - Maximize via Super+Up"
echo "  - De-Maximize via Super+Down"
echo "- Show Desktop via Super-D"
echo "- Enable Taskbar Window Grouping (eg Win 8/10)"

echo "NYI:"

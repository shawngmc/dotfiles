# dotfiles
Shawn McNaughton's dotfiles and system setup scripts in a homesick-compatible package


# Usage
## Distro-Agnostic via YADM
1. Clone the TADM Git Repo
```
git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
```
2. Symlink YADM
```
mkdir -p ~/.local/bin
ln -s ~/.yadm-project/yadm ~/.local/bin/yadm
```
2. Clone repo
```
yadm clone https://github.com/shawngmc/dotfiles.gitgit cl
```

# Changes
## Desktop Tweaks
- Enable Taskbar Window Grouping (eg Win 8/10)
- Dark Theme
- Terminal: Show running app titles
- Enable Aero Snap-style window tiling 
  - Side-by-side via Super+Left/Right
  - Maximize via Super+Up
  - De-Maximize via Super+Down
- Run Dialog via Super-R
- Show Desktop via Super-D

## Shell Tweaks
- Set Windows Title to Current Path
- Enable 

## Apps
### Installed
- Glances - TUI-based system monitor
- Goaccess - Real-time web log analyzer and interactive viewer
- Gnome-Terminal - Solid terminal, works outside of Gnome WM
- mc - TUI-base file manager
- neofetch - shell system summary
- Powerline - Better dynamic terminal prompt
- Tabbed - make any embeddable X app a tabbed app
- VIM-Nox - VIM with python preloaded

## Wishlist
- Visidata - TUI-based spreadsheet

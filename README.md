# dotfiles
Shawn McNaughton's dotfiles and system setup scripts in a homesick-compatible package


# Usage
## Distro-Agnostic via [YADM](https://yadm.io)
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
yadm clone https://github.com/shawngmc/dotfiles.git
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
| App | Online Install | Airgap Install | Configuration | Purpose |
|-----|----------------|----------------|---------------|---------|
| conda |  |  |  |  Manage Python versions and environments |
| fastfetch |  |  |  | Quick system info tool |
| fzf |  |  |  | Fuzzy finder |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
- conda:
- fastfetch: 
- fzf: 
- httpie: More friendly 'curl' command
- jq-repl: USe JQ and FZF to dynamically preview JSONPath queries
- jq: CLI tool for managing JSON files
- neovim: Better VIM with Python scripting and more
- nvm: Manage node.js versions
- powerline: Inituitive command prompt with Git and K8s support
- siege: HTTP Benchmarking utility
- testssl: Test TLS web server security fingerprint
- vlc: video player
  - TODO: Default video player
- vscode: Popular IDE
  - TODO: extensions, config settings


# TODO
- xset: CLI Clipboard tools for X
- wl-clipboard: CLI Clipboard tools for wayland
- glances: top alternative
- hyperfine: benchmark a CLI command
- goaccess: Live web log analysis tool
- lnav: Live web log analysis tool
- mc: TUI file manager
- dhex: Diffing hexeditor
- pdftk: PDF Toolkit
- yq: CLI tool for managing YAML files
- dasel: CLI tool for managing JSON/YAML/XML/etc files
- guake: pop-up terminal
  - TODO: keybinds, fonts, config settings
- powerline-fonts: nice nerd fonts

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

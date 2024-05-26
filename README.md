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
| App               | Online Install | Airgap Install | Configuration | Autostart | Purpose |
|-------------------|----------------|----------------|---------------|-----------|---------|
| conda             | Y    | Y    |      | Y    | Manage Python versions and environments |
| fastfetch         | N    | Y    | Y    | Y    | Quick system info tool |
| fzf               | Y    | Y    | N/A  | N/A  | Fuzzy finder |
| httpie(http)      | Y    | Y    | N/A  | N/A  | More friendly 'curl' command |
| jq                | Y    | Y    | N/A  | N/A  | CLI tool for managing JSON files |
| jq-repl           | Y    | NYI  | N/A  | N/A  | Use JQ and FZF to dynamically preview JSONPath queries |
| neovim            | Y    | Y    | Y    | N/A  | Better VIM with Python scripting and more |
| nvm               | Y    | N    | N/A  | N/A  | Manage node.js versions |
| powerline         | Y    | NYI  | Y    | Y    | Inituitive command prompt with Git and K8s support |
| siege             | N    | Y    | N/A  | N/A  | HTTP Benchmarking utility |
| testssl           | Y    | Y    | N/A  | Y    | Test TLS web server security fingerprint |
| vlc               | N    | Y    | NYI  | N    | Video player |
| vscode            | Y    | N    | Part | N    | Flexible lightweight IDE |
|                   |     |     |     |     | |
| dasel             |     |     |     |     | CLI tool for managing JSON/YAML/XML/etc files |
| dhex              |     |     |     |     | Diffing hexeditor |
| glances           |     |     |     |     | top alternative |
| goaccess          |     |     |     |     | Live web log analysis tool |
| guake             |     |     |     |     | pop-up terminal |
| hyperfine         |     |     |     |     | benchmark a CLI command |
| lnav              |     |     |     |     | Live web log analysis tool |
| mc                |     |     |     |     | TUI file manager |
| pdftk             |     |     |     |     | PDF Toolkit |
| powerline-fonts   |     |     |     |     | nice nerd fonts |
| visidata          |     |     |     |     | TUI-based spreadsheet |
| wl-clipboard      |     |     |     |     | CLI Clipboard tools for wayland |
| xset              |     |     |     |     | CLI Clipboard tools for X |
| yq                |     |     |     |     | CLI tool for managing YAML files | 


# TODO
- Installers for missing tools
- guake
  - keybinds
  - fonts
  - other config settings
- jq-repl
  - Just add script to repo?
- powerline
  - offline installer
- vscode
  - extensions

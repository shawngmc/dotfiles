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
| App               | Brew | Manual Online Install | Airgap Install | Configuration | Autostart | Purpose |
|-------------------|------|----------------|----------------|---------------|-----------|---------|
| brew              | N/A | Y    | N/A  | N/A  | Y    | Distro-agnostic package manager |
| conda             | N/A | Y    | Y    | N/A  | Y    | Manage Python versions and environments |
| dasel             | Y   | N    | N    | N/A  | N/A  | CLI tool for managing JSON/YAML/XML/etc files |
| fastfetch         | Y   | N    | Y    | Y    | Y    | Quick system info tool |
| fzf               | Y   | N    | Y    | N/A  | N/A  | Fuzzy finder |
| glances           | Y   | N    | Y    | N/A  | N/A  | top alternative |
| goaccess          | Y   | N    | Y    | N/A  | N/A | Live web log analysis tool with built-in queries |
| httpie(http)      | NYI | Y    | Y    | N/A  | N/A  | More friendly 'curl' command |
| jq                | Y   | N    | Y    | N/A  | N/A  | CLI tool for managing JSON files |
| jq-repl           | N/A | Y    | NYI  | N/A  | N/A  | Use JQ and FZF to dynamically preview JSONPath queries |
| lnav              | NYI |     | NYI    |     |     | Live web log analysis tool with complex queries |
| neovim            | Y   | N    | Y    | Y    | N/A  | Better VIM with Python scripting and more |
| nvm               | Y   | N    | N    | N/A  | N/A  | Manage node.js versions |
| powerline         | N/A | Y    | NYI  | Y    | Y    | Inituitive command prompt with Git and K8s support |
| siege             | Y   | N    | Y    | N/A  | N/A  | HTTP Benchmarking utility |
| testssl           | NYI | Y    | Y    | N/A  | Y    | Test TLS web server security fingerprint |
| vlc               | NYI | N    | Y    | NYI  | N    | Video player |
| vscode            | N/A | Y    | N/A  | Part | N    | Flexible lightweight IDE |
| yq                | Y   | N    | Y    | N/A  | N/A  | CLI tool for managing YAML files | 
|                   |     |     |     |     |     | |
| dhex              | NYI |     | NYI (D/U)    |     |     | Diffing hexeditor |
| guake             | N/A |     | NYI    |     |     | pop-up terminal |
| hyperfine         | Y   | N    | Y    | N/A  | N/A | benchmark a CLI command |
| mc                | N/A |     | NYI    |     |     | TUI file manager |
| pdftk             | N/A |     | NYI    |     |     | PDF Toolkit |
| powerline-fonts   | N/A |     | NYI    |     |     | nice nerd fonts (fonts-powerline on D/U, powerline-fonts on R/F, and extra 3P package from GH |
| visidata          | N/A |     | NYI (D/U)    |     |     | TUI-based spreadsheet |
| wl-clipboard      | N/A |     | NYI (ex. EL8)    |     |     | CLI Clipboard tools for wayland |
| xsel              | NYI |     | NYI    |     |     | CLI Clipboard tools for X |


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

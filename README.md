# dotfiles
Shawn McNaughton's dotfiles and system setup scripts in a homesick-compatible package


# Usage
## Distro-Agnostic via [YADM](https://yadm.io)
1. Clone the YADM Git Repo
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
# TODO
- Installers for missing tools
- App configurations
  - jq-repl
    - Just add script to repo?
  - powerline
    - offline installer
    - fonts
  - vscode
    - extensions
  - Kitty 
- KDE customizations
  - Laptop 2-finger Right-click: Settings > Mouse & Touchpad > Touchpad > Right-Click > Press Anywhere with Two Fingers
- Migrate old changes
- YADM
  - Can it detect ChromeOS as non-standard Debian?
    - I don't think so, but bootstrap mode can detect via ```cat /dev/.cros_milestone```, which will be a number if it's a cros VM
  - Implement Alternate Files: https://yadm.io/docs/alternates
    - Set kitty to X11 or Wayland appropriately
  - Implement bootstrap processing https://yadm.io/docs/bootstrap#
    - Auto install tools
    - Auto-run config changes that aren't drastically different files
    - Might be easiest to test in Hyper-V VM or ChromeOS linux containers

## Customizations
| Customization         | Fedora 40 Gnome/Wayland | Fedora 40 KDE/Wayland | ChromeOS (Debian 12) | Ubuntu 24.04 | Rocky 8 Mate/X | Purpose |
|-----------------------|-----------------|---------------|----------------------|--------------|---------|---------|
| Appearance: Dark Theme |  |  |  |  |  | A black/very dark grey theme |
| Appearance: OS Font |  |  |  |  |  |  |
| Appearance: OS Mono Font |  |  |  |  |  |  |
| Taskbar: Window Grouping |  |  |  |  |  |  |
| Keybinding: Full-Screen Terminal |  |  |  |  |  |  |
| Keybinding: Aero-Snap Side-by-Side |  |  |  |  |  | Side-by-side via Super+Left/Right |
| Keybinding: Aero-Snap Maximize |  |  |  |  |  | Maximize via Super+Up |
| Keybinding: Aero-Snap Demaximize |  |  |  |  |  | De-Maximize via Super+Down |
| Keybinding: Run Dialog |  |  |  |  |  | Run Dialog via Super-R to match windows |
| Keybinding: Show Desktop |  |  |  |  |  | Show Desktop via Super-D to match windows - might be replacing with Show FS Terminal |
| Defaults: Set Default Terminal |  |  |  |  |  | Likely choosing KiTTY at this point |
| Touchpad: Two-finger Right-Click |  |  |  |  |  |  |


## Apps
| App               | Brew | Online Install | Airgap Install | Configuration | Autostart | Purpose |
|-------------------|------|----------------|----------------|---------------|-----------|---------|
| brew              | N/A  | Y              | N/A            | N/A           | Y         | Distro-agnostic package manager |
| conda             | N/A  | Y              | Y              | N/A           | Y         | Manage Python versions and environments |
| dasel             | Y    | N              | N              | N/A           | N/A       | CLI tool for managing JSON/YAML/XML/etc files |
| fastfetch         | Y    | N              | Y              | Y             | Y         | Quick system info tool |
| fzf               | Y    | N              | Y              | N/A           | N/A       | Fuzzy finder |
| glances           | Y    | N              | Y              | N/A           | N/A       | top alternative |
| goaccess          | Y    | N              | Y              | N/A           | N/A       | Live web log analysis tool with built-in queries |
| httpie(http)      | NYI  | Y              | Y              | N/A           | N/A       | More friendly 'curl' command |
| jq                | Y    | N              | Y              | N/A           | N/A       | CLI tool for managing JSON files |
| kitty             | N/A  | Y              | Y              | Y             | N/A       | GPU accelerated terminal app |
| jq-repl           | N/A  | Y              | NYI            | N/A           | N/A       | Use JQ and FZF to dynamically preview JSONPath queries |
| lnav              | NYI  |                | NYI            |               |           | Live web log analysis tool with complex queries |
| neovim            | Y    | N              | Y              | Y             | N/A       | Better VIM with Python scripting and more |
| nvm               | Y    | N              | N              | N/A           | N/A       | Manage node.js versions |
| powerline         | N/A  | Y              | NYI            | Y             | Y         | Inituitive command prompt with Git and K8s support |
| siege             | Y    | N              | Y              | N/A           | N/A       | HTTP Benchmarking utility |
| testssl           | NYI  | Y              | Y              | N/A           | Y         | Test TLS web server security fingerprint |
| vlc               | NYI  | N              | Y              | NYI           | N         | Video player |
| vscode            | N/A  | Y              | N/A            | Part          | N         | Flexible lightweight IDE |
| yq                | Y    | N              | Y              | N/A           | N/A       | CLI tool for managing YAML files | 
|                   |      |                |                |               |           | |
| dhex              | NYI  |                | NYI (D/U)      |               |           | Diffing hexeditor |
| hyperfine         | Y    | N              | Y              | N/A           | N/A       | benchmark a CLI command |
| mc                | N/A  |                | NYI            |               |           | TUI file manager |
| pdftk             | N/A  |                | NYI            |               |           | PDF Toolkit |
| powerline-fonts   | N/A  |                | NYI            |               |           | nice nerd fonts (fonts-powerline on D/U, powerline-fonts on R/F, and extra 3P package from GH |
| visidata          | N/A  |                | NYI (D/U)      |               |           | TUI-based spreadsheet |
| wl-clipboard      | N/A  |                | NYI (ex. EL8)  |               |           | CLI Clipboard tools for wayland |
| xsel              | NYI  |                | NYI            |               |           | CLI Clipboard tools for X |

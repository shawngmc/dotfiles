# dotfiles
Shawn McNaughton's dotfiles and system setup scripts in a homesick-compatible package


# Usage
## Initial Distro-Agnostic Pull via [YADM](https://yadm.io)
1. Clone the YADM Git Repo
```
git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
```
2. Symlink YADM
```
mkdir -p ~/.local/bin
ln -s ~/.yadm-project/yadm ~/.local/bin/yadm
```
3. Clone repo
```
yadm clone https://github.com/shawngmc/dotfiles.git
```

## Fedora
TBD

## ChromeOS
TBD

## Rocky8
TBD

## Ubuntu
TBD



# Apps
## CLI Apps
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
| jq-repl           | N/A  | Y              | NYI            | N/A           | N/A       | Use JQ and FZF to dynamically preview JSONPath queries |
| lnav              | Y    | Y              | Y              |               |           | Live web log analysis tool with complex queries |
| neovim            | Y    | N              | Y              | Y             | N/A       | Better VIM with Python scripting and more |
| nvm               | Y    | N              | N              | N/A           | N/A       | Manage node.js versions |
| powerline         | N/A  | Y              | NYI            | Y             | Y         | Inituitive command prompt with Git and K8s support |
| siege             | Y    | N              | Y              | N/A           | N/A       | HTTP Benchmarking utility |
| testssl           | NYI  | Y              | Y              | N/A           | Y         | Test TLS web server security fingerprint |
| vim-airline       | NYI  | Y              | Y              | N/A           | Y         | Add a lightweight prompt to VIM statusbar that doesn't need python |
| vim-fugitive      | NYI  | Y              | Y              | N/A           | Y         | Add Git support to VIM |
| yq                | Y    | N              | Y              | N/A           | N/A       | CLI tool for managing YAML files | 

### GUI Apps
| App               | Online Install | Airgap Install | Configuration | Autostart | Purpose |
|-------------------|----------------|----------------|---------------|-----------|---------|
| kitty             | Y              | Y              | Y             | N/A       | GPU accelerated terminal app |
| vscode            | Y              | N/A            | Part          | N         | Flexible lightweight IDE |
| vlc               | N              | Y              | NYI           | N         | Video player |

## Wishlist
| App               | Brew | Online Install | Airgap Install | Configuration | Autostart | Purpose |
|-------------------|------|----------------|----------------|---------------|-----------|---------|
| dhex              | NYI  |                | NYI (D/U)      |               |           | Diffing hexeditor |
| hyperfine         | Y    | N              | Y              | N/A           | N/A       | benchmark a CLI command |
| mc                | N/A  |                | NYI            |               |           | TUI file manager |
| pdftk             | N/A  |                | NYI            |               |           | PDF Toolkit |
| visidata          | N/A  |                | NYI (D/U)      |               |           | TUI-based spreadsheet |
| wl-clipboard      | N/A  |                | NYI (ex. EL8)  |               |           | CLI Clipboard tools for wayland |
| xsel              | NYI  |                | NYI            |               |           | CLI Clipboard tools for X |

# Fonts
Using the [CodingFont Tournament Bracket](https://www.codingfont.com/), I found I like Roboto Mono: More readable, slashed zeroes, sans-serif, good contrast. But unfortunately, it's bitmap, so it doesn't work with KiTTY.

Based on the [font FAQ for KiTTY](https://sw.kovidgoyal.net/kitty/faq/#kitty-is-not-able-to-use-my-favorite-font), it's not that Roboto Mono is bitmap. It's that it doesn't have consistent spacing calculations; adding the override file fixes it.

Instead of Powerline-only fonts, the [Nerd Fonts](https://www.nerdfonts.com/) Symbols Only Font is probably the best solution.

Since font packages aren't in most repos, the fonts themselves are included in the dotfiles repo.
- [fonts](https://github.com/shawngmc/dotfiles/tree/main/.local/share/fonts)
- [overrides](https://github.com/shawngmc/dotfiles/blob/main/.config/fontconfig/fonts.conf)

These are set in the dotfiles to be used in:
- [kitty](https://github.com/shawngmc/dotfiles/blob/main/.config/kitty/kitty.conf)
- [VS Code](https://github.com/shawngmc/dotfiles/blob/main/.config/Code/User/settings.json)

# Customizations
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

# TODO
- Installers for missing tools
- App configurations
  - jq-repl
    - Just add script to repo?
  - powerline
    - offline installer
  - vscode
    - extensions
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

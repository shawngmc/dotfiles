#!/bin/bash

echo "Installing:"
echo "- glances: TUI system monitor"
echo "- goaccess: Real-time web log analyzer and interactive viewer"
echo "- mc: TUI file manager"
echo "- neofetch*: Shell system summary"
echo "- powerline*: Shell Prompt Improvements"
echo "- neovim: vim modernized"
echo "- python3-pynvim: python3 support for neovim
sudo apt install -y \
  glances \
  goaccess \
  mc \
  neofetch \
  powerline \
  neovim \
  python3-pynvim

echo "*: Custom .bashrc should pick up and run this now."

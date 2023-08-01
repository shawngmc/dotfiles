#!/bin/bash

echo "Installing:"
echo "- glances: TUI system monitor"
echo "- goaccess: Real-time web log analyzer and interactive viewer"
echo "- mc: TUI file manager"
echo "- neofetch*: Shell system summary"
echo "- powerline*: Shell Prompt Improvements"
echo "- vim-nox: vim with Python3 bindings"
sudo apt install -y \
  glances \
  goaccess \
  mc \
  neofetch \
  powerline \
  vim-nox \

echo "*: Custom .bashrc should pick up and run this now."

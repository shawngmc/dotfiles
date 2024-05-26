#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

if (( $(is_airgapped) == 1 )); then

  echo "Installing nvm..."
  mkdir -p ~/.nvm;
  brew install nvm;

  export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

  #echo "Adding .bashrc.d file...";
  #cat << 'EOF' > ~/.bashrc.d/nvm.sh
  ##!/bin/bash
  #
  #export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  #[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  #EOF

  echo "Activating NVM in this subshell..."
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  echo "Install Latest Node LTS and npm..."
  nvm install --lts
  nvm install-latest-npm

else
  echo "nvm isn't in package repos...";
  exit 1;
fi

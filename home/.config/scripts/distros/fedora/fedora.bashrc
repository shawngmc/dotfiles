# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shawn/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shawn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shawn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shawn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set window title to path when changing directories
set-window-title() {
  echo -en "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
}
if [[ "$PROMPT_COMMAND" ]]; then
  export PROMPT_COMMAND="$PROMPT_COMMAND;set-window-title"
else
  export PROMPT_COMMAND=set-window-title
fi

# If installed, run powerline

if [ -f "/usr/share/powerline/bindings/bash/powerline.sh" ]; then
    POWERLINE_PATH="/usr/share/powerline/bindings/bash/powerline.sh"
elif [ -f $(which powerline) ]; then
    POWERLINE_PAHT=$(which powerline)
fi

echo $POWERLINE_PATH
if [ -z $POWERLINE_PATH ]; then
  STATUS="$(systemctl is-active powerline-daemon.service --user)"
  if [ "${STATUS}" != "active" ]; then
      systemctl start powerline-daemon.service --user
  fi
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . $POWERLINE_PATH
fi

# Source a .bashrc.local, if it exists
if [ -f "~/.bashrc.local" ]; then
  . ~/.bashrc.local
fi

# Run neofetch if present
builtin type -P neofetch
if [ $? -eq 0 ]; then
  neofetch
fi

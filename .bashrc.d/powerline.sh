#!/bin/bash

# Run conda activate if present, then enable powerline
CONDA_PATH=$(which condai 2>/dev/null)
if [ $? -eq 0 ]; then
  conda activate base
  POWERLINE_PATH=$(python3 -m pip show powerline-status | grep "Location:" | sed "s/Location: //")/powerline
  if [ -f ${POWERLINE_PATH}/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    PROMPT_COMMAND=""
    source ${POWERLINE_PATH}/bindings/bash/powerline.sh
  fi
fi

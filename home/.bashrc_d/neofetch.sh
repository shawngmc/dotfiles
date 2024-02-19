#!/bin/bash

# Run neofetch if present
NEOFETCH_PATH=$(which neofetch)
if [ $? -eq 0 ]; then
  $NEOFETCH_PATH
fi

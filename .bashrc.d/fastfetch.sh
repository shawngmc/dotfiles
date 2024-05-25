#!/bin/bash

# Run fastfetch if present
FASTFETCH_PATH=$(which fastfetch 2>/dev/null)
if [ $? -eq 0 ]; then
  $FASTFETCH_PATH
fi

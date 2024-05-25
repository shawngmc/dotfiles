#!/bin/bash

# Run fastfetch if present
FASTFETCH_PATH=$(which fastfetch)
if [ $? -eq 0 ]; then
  $FASTFETCH_PATH
fi

#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Copy Neovim plugin.

作成: 2024/01/13: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
set -eu

# If directory doesn't exist, create directory.
config_dir="${HOME}/.config"
if [ ! -d ${config_dir} ]; then
  mkdir ${config_dir}
fi

# Copy Neovim plugin directory.
copy_dir="./nvim"
cp -r ${copy_dir} ${config_dir}

exit 0

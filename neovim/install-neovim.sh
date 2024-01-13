#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Install neovim

If neovim is already installed, it exists with an error "1".
Otherwise, it exits with normal "0".

作成: 2024/01/13: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
set -eu

if [ "$(uname)" == 'Darwin' ]; then
  # For macOS
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
  tar xzf nvim-macos.tar.gz
  ./nvim-macos/bin/nvim
elif [ "$(uname)" == 'Linux' ]; then
  # For Linux
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  ./squashfs-root/AppRun --version
  mv squashfs-root /
  ln -s /squashfs-root/AppRun /usr/bin/nvim
else
  echo "$(uname) is not supported." 1>&2
  exit 1
fi

echo 'Neovim was Installed'

exit 0

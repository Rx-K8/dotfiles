#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Setup Neovim.
- Install Neovim.
- Create a symbolic link ot nvim directory.

Date Created: 2024/01/13: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
set -eu

# Make sure that Neovim is alreay installed.
if [ -n $(which nvim) ]; then
  echo 'Neovim alreay is existed.' 1>&2
  exit 1
fi

### Install Neovim ###
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
  rm nvim.appimage
else
  echo "$(uname) is not supported." 1>&2
  exit 1
fi
echo 'Neovim was Installed!!!!!!'

### Symbolic link nvim directory ###
# If directory doesn't exist, create directory.
if [ ! -d ${HOME}/.config ]; then
  mkdir ${config_dir}
fi

# Copy Neovim plugin directory.
ln -s ${HOME}/dotfiles/neovim/nvim ${HOME}/.config/nvim
echo 'The symbolic link was successfully created!!!!!!'

exit 0

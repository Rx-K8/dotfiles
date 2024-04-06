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


### Install Neovim ###
function install_neovim() {
  if [ "$(uname)" == 'Darwin' ]; then
    ### For macOS
    # Install Neovim
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    tar xzf nvim-macos.tar.gz
    ./nvim-macos/bin/nvim

  elif [ "$(uname)" == 'Linux' ]; then
    ### For Linux
    # Install Neovim
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

  echo 'Done isntall neovim.'
}

### Symbolic link nvim ###
function symbolic_link() {
  # If directory doesn't exist, create directory.
  if [ ! -d ${HOME}/.config ]; then
    mkdir ${HOME}/.config 
  fi
  ln -s "${SOURCE_NEOVIMDIR}" "${TARGET_NEOVIMDIR}"
  echo 'Done symbolic link.'
}

# Make sure that Neovim is already installed.
if [ $(which nvim) ]; then
  echo 'Neovim is already installed.'
else
  install_neovim
fi

# Make sure that neovim symbolic link is already installed.
SOURCE_NEOVIMDIR="${HOME}/dotfiles/neovim/nvchad"
TARGET_NEOVIMDIR="${HOME}/.config/nvim"
if [ -L "${TARGET_NEOVIMDIR}" ]; then
  echo 'neovim symbolic link is already existed.'
else
  symbolic_link ${SOURCE_NEOVIMDIR} ${TARGET_NEOVIMDIR} 
fi
exit 0

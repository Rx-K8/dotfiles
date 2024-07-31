#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
This script installs Neovim on macOS or Linux systems.

USAGE:
  chmod +x install_neovim.sh
  ./install_neovim.sh

DESCRIPTION:
  - This script checks if Neovim is installed on the system.
  - If Neovim is not installed, it installs Neovim.
  - The script is designed to run on macOS and Linux.

Created Date: 2024/01/13 FUKUOKA Keito
Updated Date: 2024/07/31 FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

function install_neovim() {
  os_type=$(uname)
  if [ "${os_type}" = 'Darwin' ]; then
    brew install neovim

  elif [ "${os_type}" = 'Linux' ]; then
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

  echo 'Done install neovim.'
}


function exists_command() {
  if command -v nvim > /dev/null 2>&1; then
    echo 'Neovim is already installed.'
    exit 0
  fi
}

function main() {
  exists_command
  install_neovim

  exit 0
}

# Call the main function only if the script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi

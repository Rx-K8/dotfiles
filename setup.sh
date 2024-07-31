#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------

USAGE:
  chmod +x setup.sh
  ./setup.sh

DESCRIPTION:

Created Date: 2024/07/31 FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

function grant_permission() {
  for file in ./**/*.sh; do
    if [ -f "$file" ]; then
      chmod +x "$file"
    fi
    echo $file
  done
}

function run_install_script() {
  ./homebrew/install.sh
  ./asdf/install.sh
  ./asdf/install-java.sh
  ./asdf/install-python.sh
  ./asdf/install-nodejs.sh
  ./neovim/install.sh
}

function create_symbolic_links() {
  dotfiles=(
    'bashrc'
    'bash_profile'
    'aliases'
  )

  for file in ${dotfiles[@]}; do
    source="${HOME}/dotfiles/.${file}"
    target="${HOME}/.${file}"
    if [ ! -L "${target}" ]; then
      ln -s "${source}" "${target}"
      echo "Done creating symbolic link: ${target}"
    fi
  done
}

function copy_gitconfig() {
  if [ -f "$HOME/.gitconfig" ]; then
    echo ".gitconfig is already exists. No copies will be made."
  else
    cp "${HOME}/git/.gitconfig" "${HOME}/.gitconfig"
    echo "Done copying .gitconfig"
  fi
}

function main() {
  grant_permission
  copy_gitconfig
  create_symbolic_links
  run_install_script

  exit 0
}

# Call the main function only if the script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi

#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Setup git.
- Create a symbolic link for tmux.

Date Created: 2024/04/27: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
set -eu

### Create symbolic link ###
function symbolic_link() {
  source=$1
  target=$2

  if [ ! -L "${target}" ]; then
    ln -s "${source}" "${target}"
  fi
}


# dotfile list
SETTINGFILES=(
  '.gitconfig'
)

for file in ${SETTINGFILES[@]}; do
  source="${HOME}/dotfiles/git/${file}"
  target="${HOME}/${file}"
  symbolic_link "${source}" "${target}"
done

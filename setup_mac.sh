#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Setup dotfiles.
- Create a symbolic link to dotfiles. 
Date Created: 2024/04/06: FUKUOKA Keito
Updated Date: 2024/04/06: FUKUOKA Keito
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
DOTFILES=(
  'bashrc'
  'bash_profile'
  'aliases'
)

for file in ${DOTFILES[@]}; do
  source="${HOME}/dotfiles/.${file}"
  target="${HOME}/.${file}"
  symbolic_link ${source} ${target}
done


#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Setup Cursor.
- Create a symbolic link for Cursor.

Date Created: 2024/04/11: FUKUOKA Keito
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
  'settings.json'
  'keybindings.json'
)

for file in ${SETTINGFILES[@]}; do
  source="${HOME}/dotfiles/cursor/${file}"
  target="${HOME}/Library/Application Support/Cursor/User/${file}"
  symbolic_link "${source}" "${target}"
done

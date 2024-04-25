#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Setup Cursor.
- Create a symbolic link for VSCode.

Created Date: 2024/04/13: FUKUOKA Keito
Uplated Date: 2024/04/25: FUKUOKA Keito
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
)

for file in ${SETTINGFILES[@]}; do
  source="${HOME}/dotfiles/vscode/${file}"
  target="${HOME}/Library/Application Support/Code/User/${file}"
  symbolic_link "${source}" "${target}"
done

# Install extensions using the code command
if [ "$(which code)" != "" ]; then
  cat < "${HOME}/dotfiles/extensions" | while read -r line
  do
    code --install-extension "$line"
  done
else
  echo "Install the code command from the command palette to add your extensions."
fi

exit 0

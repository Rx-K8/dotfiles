#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Install asdf

if asdf is already installed, returns error "1"

Date Created: 2024/01/14: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

# Make sure that asdf is already installed.
if [ $(which asdf) ]; then
  echo 'asdf is already installed.' 1>&2
fi

# Make sure that shell is bash.
if [ "${SHELL##*/}" != 'bash' ]; then
  echo 'This script is only bash.'
  exit 1
fi

# Download asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# settings
asdf_target={
  'source ${HOME}/.asdf/asdf.sh'
  'source ${HOME}/.asdf/completions/asdf.bash'
}
if [ "$(uname)" == 'Darwin' ]; then
  for each in "${asdf_target[@]}"; do
    eval ${each}
    echo ${each} >>"${HOME}/.bash_profile"
elif [ "$(uname)" == 'Linux' ]: then
  for each in "${asdf_target[@]}"; do
    eval ${each}
    echo ${each} >>"${HOME}/.bashrc"
else
  echo "$(uname) is not supported." 1>&2
  exit 1
fi

echo 'Installation of asdf is compete!!!!!!'
exit 0


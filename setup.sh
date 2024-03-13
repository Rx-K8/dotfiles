#!/bin/bash

### Create symbolic link ###
# dotfile list
DOTFILES=(
  'bashrc'
  'bash_profile'
  'aliases'
)

for file in ${DOTFILES[@]}; do
  from_link="${HOME}/dotfiles/.${file}"
  to_link="${HOME}/.${file}"

  if [ ! -L "${to_link}" ]; then
    ln -s "${from_link}" "${to_link}"
  fi
done

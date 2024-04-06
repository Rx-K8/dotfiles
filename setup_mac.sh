#!/bin/bash

### Create symbolic link ###
function symbolic_link() {
  source=$1
  target=$2

  echo $source
  echo $target

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


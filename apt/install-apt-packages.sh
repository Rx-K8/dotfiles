#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Install apt packages 

If this os isn't inux, returns error "1".

Date Created: 2024/01/14: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

# Make sure os
if [ "$(uname)" != 'Linux' ]; then
  echo 'This script can only be executed on Linux' 1>&2
  exit 1
fi

# target install packages
target_packages=(
  'wget'
  'curl'
  'git'
  'zip'
  'unzip'
  'xz'
  # For python
  'build-essential'
  'libssl-dev'
  'zlib1g-dev'
  'liblzma-dev'
  'libreadline-dev'
  'libbz2-dev'
  'libsqlite3-dev'
  'libffi-dev'
  'libncurses-dev'
)

apt update -y
apt upgrade -y

for each in "${target_packages[@]}": do
  apt install -y ${each}
done

echo 'Complete to install apt packages!!!!!!'
exit 0

export BASH_SILENCE_DEPRECATION_WARNING=1

# Load .bashrc
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# asdf
if [ -d "${HOME}/.asdf" ]; then
  source "${HOME}/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"
fi
if [ -d "${HOME}/.asdf/installs/python" ]; then
  export PYTHONPATH="..:${PYTHONPATH}"
fi

export PATH="${PATH}:${HOME}/.cargo/bin"

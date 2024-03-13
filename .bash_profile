# Load .bashrc
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# asdf
if [ -d "${HOME}/.asdf" ]; then
  source "${HOME}/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"
fi

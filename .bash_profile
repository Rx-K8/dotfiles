export BASH_SILENCE_DEPRECATION_WARNING=1

# Load .bashrc
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# asdf
if [ -d "${HOME}/.asdf" ]; then
  source "${HOME}/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"

  if command -v java > /dev/null 2>&1; then
    source ~/.asdf/plugins/java/set-java-home.bash
  fi
fi

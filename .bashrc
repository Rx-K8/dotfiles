# Load alias
if [ -f "${HOME}/.aliases" ] ; then
  source "${HOME}/.aliases"
fi

# Load git completion
if [ -d "${HOME}/.bash/completions/" ] ; then
  for file in ${HOME}/.bash/completions/* ; do
    source $file
  done
fi

# Default editor
export EDITOR="nvim"

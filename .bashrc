# Load alias
if [ -f "${HOME}/.aliases" ] ; then
  source "${HOME}/.aliases"
fi

# Load git completion
git_dir="${HOME}/dotfiles/git/completions/"
if [ -d "${git_dir}" ] ; then
  files=('git-completion.bash' 'git-prompt.sh')
  for file in "${files[@]}"; do
    target="${git_dir}${file}"
    source "${target}"
  done
fi

# Default editor
export EDITOR="nvim"

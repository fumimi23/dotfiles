# git
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

# nodenv
eval "$(nodenv init - --no-rehash)"

# pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# phpenv
eval "$(phpenv init -)"

# starship
eval "$(starship init zsh)"

# alias
source $ZDOTDIR/.zalias

# bash-completion
source /usr/share/bash-completion/completions/git

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# alias
source $BASHDOTDIR/.bash_aliases

# Starship
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/dotfiles/starship.toml
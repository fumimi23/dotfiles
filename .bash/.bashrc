# bash-completion
source /usr/share/bash-completion/completions/git

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# alias
source $BASHDOTDIR/.bash_aliases
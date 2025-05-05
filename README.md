# dotfiles

## How to install

### zsh

1. 以下を`$HOME/.zshenv`に追記

```shell
# My dotfiles
if [ -d "$HOME/dotfiles/.zsh" ] ; then
    export ZDOTDIR=$HOME/dotfiles/.zsh
    source $ZDOTDIR/.zshenv
fi
```

2. 以下のコマンドを1行ずつ実行
```shell
#starship
curl -sS https://starship.rs/install.sh | sh
exec $SHELL -l

# nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
exec $SHELL -l
git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)"/plugins/nodenv-update

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
exec $SHELL -l
git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
exec $SHELL -l

# phpenv
# TODO: install phpenv

# goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv
exec $SHELL -l
```

### bash

1. 以下を`$HOME/.bashrc`に追記

```shell
# My dotfiles
if [ -d "$HOME/dotfiles/.bash" ] ; then
    export BASHDOTDIR=$HOME/dotfiles/.bash
    source $BASHDOTDIR/.bashrc
fi
```

2. 以下のコマンドを1行ずつ実行
```shell
#starship
curl -sS https://starship.rs/install.sh | sh
exec $SHELL -l

# nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
exec $SHELL -l
git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)"/plugins/nodenv-update

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
exec $SHELL -l
git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
exec $SHELL -l
sudo apt install build-essential libbz2-dev libdb-dev libreadline-dev libffi-dev libgdbm-dev liblzma-dev libncursesw5-dev libsqlite3-dev libssl-dev zlib1g-dev uuid-dev tk-dev
```
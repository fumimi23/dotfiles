# dotfiles

## How to install

### zsh

以下を`$HOME/.zshenv`に追記

```shell
if [ -d "$HOME/dotfiles/.bash" ] ; then
    export ZDOTDIR=$HOME/dotfiles/.zsh
    source $ZDOTDIR/.zshenv
fi
```

### bash

以下を`$HOME/.bashrc`に追記

```shell
if [ -d "$HOME/dotfiles/.bash" ] ; then
    export BASHDOTDIR=$HOME/dotfiles/.bash
    source $BASHDOTDIR/.bashrc
fi
```
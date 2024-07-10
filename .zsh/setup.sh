#!/usr/bin/zsh

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

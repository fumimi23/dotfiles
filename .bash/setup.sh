#!/bin/bash

# apt udate
sudo apt update
sudo apt upgrade

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

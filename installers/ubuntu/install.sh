#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install zsh\
    ripgrep \
    tmux \
    fd-find

sudo snap install nvim --classic

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

asdf plugin add nodejs
asdf plugin add golang
asdf plugin add python
asdf plugin add rust

asdf install nodejs latest
asdf install golang latest
asdf install python latest
asdf install rust latest

asdf global nodejs latest
asdf global golang latest
asdf global python latest
asdf global rust latest

npm i -g yarn

mkdir -p ~/.local/share/nvim/site/pack/packer/start
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

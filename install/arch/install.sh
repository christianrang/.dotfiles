#!/bin/bash

# Lazy way to install packages. Ideally this will be handled by ansible one day

sudo pacman -Syu
sudo pacman -S go
sudo pacman -S npm
sudo pacman -S python
sudo pacman -S python-pip

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install gopls
go install golang.org/x/tools/gopls@latest

# install golangci-lint
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1

# install pyright
npm install -g pyright

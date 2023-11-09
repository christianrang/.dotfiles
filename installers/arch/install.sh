#!/bin/bash

# Lazy way to install packages. Ideally this will be handled by ansible one day

sudo pacman -Syu
sudo pacman -S stow
sudo pacman -S neovim 
sudo pacman -S go
sudo pacman -S npm
sudo pacman -S python
sudo pacman -S python-pip

# install vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.local/share/nvim/site/pack/packer/start
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install gopls
go install golang.org/x/tools/gopls@latest

# install golangci-lint
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1

# install pyright
sudo npm install -g pyright

# install rust-analyzer
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# install rls
rustup update
rustup component add rls rust-analysis rust-src


#!/bin/bash

# Lazy way to install packages. Ideally this will be handled by ansible one day

sudo pacman -Syu
sudo pacman -S stow \
	alacritty \
	neovim \
	go \
	npm \
	python \
	python-pip \
	tmux

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

# install tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.local/share/nvim/site/pack/packer/start
# NOTE: packer.nvim should be installed by the nvim --headless command but if it is not then uncomment the following line
# git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless ~/.config/nvim/lua/personal/packer.lua +source -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install gopls
go install golang.org/x/tools/gopls@latest

# install golangci-lint
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# install pyright
sudo npm install -g pyright

# install rust-analyzer
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# install rls
rustup update
rustup component add rls rust-analysis rust-src

# Install Catpuccin GTK 3 theme
# https://github.com/catppuccin/gtk
yay -S catppuccin-gtk-theme-mocha catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte

# Install Catpuccin icon theme
# https://github.com/catppuccin/papirus-folders
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-mocha-blue --theme Papirus-Dark

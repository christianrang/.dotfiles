# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bin:/usr/local/bin:/usr/local/mongodb/bin:$PATH

set -o vi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git
    zsh-autosuggestions
    golang
    z
    docker
    kubectl
    python
    react-native
    terraform
    helm
    fzf
)

source $ZSH/oh-my-zsh.sh

alias ll="ls -l"
alias xclip="pbcopy"
# Neovim
alias vim="nvim"
export EDITOR="nvim" # Kubernetes stuffs
alias k=kubectl
source <(kubectl completion zsh)
alias kctx=kubectx
alias kns=kubens

alias glow="glow -p"
alias cat="bat"

# Tmux stuffs
# Start Tmux automatically
if [ "$TMUX" = "" ]; then tmux attach; fi

export PROGDEV="$HOME/progdev"
export GITHUBPATH="$PROGDEV/github.com"
export CRGHPATH="$GITHUBPATH/christianrang"
export NOTES="$HOME/notes/"

export GOPATH="$PROGDEV/go"
export PATH="$PATH:$GOPATH/bin"

. "$HOME/.asdf/asdf.sh"

# Source other RC's depending on system I'm using
# for WSL
if [ -f ~/.wslrc ]; then source ~/.wslrc; fi
if [ -f ~/.linuxrc ]; then source ~/.linuxrc; fi

if [ ! -d $PROGDEV ]; then mkdir -p $PROGDEV; echo created $PROGDEV; fi
if [ ! -d $GITHUBPATH ]; then mkdir -p $GITHUBPATH; echo created $GITHUBPATH; fi
if [ ! -d $CRGHPATH ]; then mkdir -p $CRGHPATH; echo created $CRGHPATH; fi
if [ ! -d $NOTES ]; then mkdir -p $NOTES; echo created $NOTES; fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then 
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ~/.asdf ]; then 
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
fi

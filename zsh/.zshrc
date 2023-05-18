# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/mongodb/bin:$PATH

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
export EDITOR="nvim"

# Kubernetes stuffs
alias k=kubectl
source <(kubectl completion zsh)
alias kctx=kubectx
alias kns=kubens

alias glow="glow -p"

# Tmux stuffs
# Start Tmux automatically
if [ "$TMUX" = "" ]; then tmux attach; fi

export GOPATH="$HOME/progdev/go"
export PATH="$PATH:$GOPATH/bin"

. "$HOME/.asdf/asdf.sh"

export GHPATH="$HOME/progdev/github"
export CRGHPATH="$HOME/progdev/github/christianrang"

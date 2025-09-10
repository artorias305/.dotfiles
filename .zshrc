export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export BROWSER='brave'

PROMPT='λ '

alias vim='nvim'
alias vi='nvim'
alias src='source ~/.zshrc'

alias ls="eza -g --icons"

eval "$(zoxide init zsh)"

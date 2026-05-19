export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD

path_prepend() {
  [[ -d "$1" ]] && export PATH="$1:$PATH"
}

OS="$(uname)"

case "$OS" in
  Darwin)
    path_prepend /opt/homebrew/bin
    path_prepend /opt/homebrew/opt/llvm/bin
    path_prepend "$HOME/.local/bin"
    ;;
  Linux)
    path_prepend "$HOME/.local/bin"

    FNM_PATH="$HOME/.local/share/fnm"
    if [ -d "$FNM_PATH" ]; then
      path_prepend "$FNM_PATH"
      eval "$(fnm env)"
    fi
    ;;
esac

path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/.opencode/bin"
path_prepend "$HOME/bin"

export BUN_INSTALL="$HOME/.bun"
path_prepend "$BUN_INSTALL/bin"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

alias ls="ls --color=auto"
alias lg="lazygit"
alias src="source ~/.zshrc"

if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"

  alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

  finder() {
    open .
  }

  zle -N finder
  bindkey '^f' finder
fi

autoload -z edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

path_prepend "$HOME/.config/emacs/bin"

[[ ":$PATH:" != *":$HOME/.config/kaku/zsh/bin:"* ]] && export PATH="$HOME/.config/kaku/zsh/bin:$PATH" # Kaku PATH Integration
[[ -f "$HOME/.config/kaku/zsh/kaku.zsh" ]] && source "$HOME/.config/kaku/zsh/kaku.zsh" # Kaku Shell Integration

# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# plugins=(git)
#
# source $ZSH/oh-my-zsh.sh

ZIM_CONFIG_FILE=~/.zimrc

ZIM_HOME=${ZDOT:-${HOME}}/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
    https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi

source ${ZIM_HOME}/init.zsh

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

export EDITOR="nvim"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

autoload -z edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

open_current_dir() {
  open .
}

zle -N open_current_dir
bindkey '^f' open_current_dir

alias clang++="clang++ -std=c++26"

goinit() {
    go mod init "github.com/artorias305/$(basename "$PWD")"
}

export PATH="$HOME/go/bin:$PATH"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/kiq/.opam/opam-init/init.zsh' ]] || source '/Users/kiq/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

alias wslview="explorer.exe"

eval "$(zoxide init zsh)"

export PATH="$HOME/c3:$PATH"

export MANPAGER="nvim +Man!"

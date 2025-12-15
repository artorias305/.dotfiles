autoload -U colors && colors
bindkey -v
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

mkcd() {
	mkdir -p "$1" && cd "$1"
}

_comp_options+=(globdots)

export PATH="/Users/kiq/8086-TASM-RUN:/Users/kiq/.config/emacs/bin:/Users/kiq/.cargo/bin:/home/kiq/.cargo/bin:$PATH"

if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -d /opt/homebrew/bin ]]; then
        export PATH="/opt/homebrew/bin:$PATH"
    fi
    export PATH="/Users/kiq/.local/bin:$PATH"
    export C_INCLUDE_PATH="$(brew --prefix)/include:$C_INCLUDE_PATH"
    export LIBRARY_PATH="$(brew --prefix)/lib:$LIBRARY_PATH"
    export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
    export PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig:$PKG_CONFIG_PATH"
    export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/opt/homebrew/opt/glfw/include"
    export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/opt/homebrew/opt/raylib/include"
    export LIBRARY_PATH="${LIBRARY_PATH}:/opt/homebrew/opt/glfw/lib"
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
	. ~/.linuxify
fi

autoload -U compinit && compinit
autoload -U colors && colors

alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias vim="nvim"
alias src="source ~/.zshrc"
alias ls="ls -F --color=auto"
alias ll="eza -l -g --icons"
alias lg="lazygit"

export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export HISTIGNORE='exit:cd:ls:bg:fg:history:f:fd:vim'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(fzf --zsh)"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -s "/home/kiq/.bun/_bun" ] && source "/home/kiq/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/home/kiq/.local/bin"

source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

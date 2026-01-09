export ZSH="$HOME/.oh-my-zsh"

PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

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
	# . ~/.linuxify
fi

if [[ "$(uname)" == "Linux" ]]; then
	export PATH="$HOME/.local/bin:$PATH"
	. "/home/kiq/.local/share/bob/env/env.sh"
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

eval "$(fzf --zsh)"
eval "$(starship init zsh)"

export PATH="$HOME/.cargo/bin:$PATH"

# opencode
export PATH=/home/kiq/.opencode/bin:$PATH

export EDITOR="nvim"

alias lg="lazygit"
alias src="source ~/.zshrc"

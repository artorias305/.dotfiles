export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="artorias"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
PROMPT='%F{magenta}%~%f %F{green}$(git_prompt_info) > %f'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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

eval "$(fzf --zsh)"

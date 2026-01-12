# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim

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
. "$HOME/.cargo/env"

export PATH="$PATH:/home/kiq/.local/bin"
. "/home/kiq/.local/share/bob/env/env.sh"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

PS1='[\u@\h \W]\$ '

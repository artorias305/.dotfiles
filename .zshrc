if [[ -d /opt/homebrew/bin ]]; then
  PATH="/opt/homebrew/bin:${PATH}"
fi

PROMPT='[%n:%m %~]$ '

export PATH="/Users/kiq/8086-TASM-RUN:$PATH"
export PATH="/Users/kiq/.config/emacs/bin:$PATH"

bindkey -e

export PATH="/Users/kiq/.local/bin:$PATH"
export C_INCLUDE_PATH="$(brew --prefix)/include:$C_INCLUDE_PATH"
export LIBRARY_PATH="$(brew --prefix)/lib:$LIBRARY_PATH"
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig:$PKG_CONFIG_PATH"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/opt/homebrew/opt/glfw/include"
export CPLUS_INCLUDE_PATH="${PLUS_INCLUDE_PATH}:/opt/homebrew/opt/raylib/include"
export LIBRARY_PATH="${LIBRARY_PATH}:/opt/homebrew/opt/glfw/lib"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 

export PATH="/Users/kiq/.config/emacs/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 21)

alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias nvim="bob run nightly"
alias vim="nvim"
alias src="source ~/.zshrc"
alias ls="ls -F --color=auto"
alias ll="eza -l -g --icons"

export EDITOR="bob run nightly"
export MANPAGER="bob run nightly +Man!"

export HISTIGNORE='exit:cd:ls:bg:fg:history:f:fd:vim'

lazy_load_nvm() {
  unset -f node nvm
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

node() {
  lazy_load_nvm
  node $@
}

nvm() {
  lazy_load_nvm
  node $@
}

# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# eval "$(starship init zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

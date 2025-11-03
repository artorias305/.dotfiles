autoload -U colors && colors
bindkey -e
# PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

source <(fzf --zsh)
finder() {
    open .
}

zle -N finder
bindkey '^f' finder

normalize() {
  ffmpeg -i "$1" -af loudnorm=I=-14:TP=-1.0:LRA=11 -c:v copy -c:a aac -b:a 192k output.mp4
}


# Basic auto/tab complete:
autoload -U compinit && compinit
autoload -U colors && colors
zmodload zsh/complist

_comp_options+=(globdots)		# Include hidden files.

export PATH="/Users/kiq/.local/bin:$PATH"
export C_INCLUDE_PATH="$(brew --prefix)/include:$C_INCLUDE_PATH"
export LIBRARY_PATH="$(brew --prefix)/lib:$LIBRARY_PATH"
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig:$PKG_CONFIG_PATH"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/opt/homebrew/opt/glfw/include"
export LIBRARY_PATH="${LIBRARY_PATH}:/opt/homebrew/opt/glfw/lib"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 

export PATH="/Users/kiq/.config/emacs/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 21)

alias love="/Applications/love.app/Contents/MacOS/love"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias venv="source .venv/bin/activate"
alias nvim="bob run nightly"
alias vim=nvim
alias vi="nvim"
alias im="nvim"
alias nm="neomutt"
alias p="poetry"
alias yt="lux"
alias dl="lux"
alias rip="yt-dlp -x --audio-format=\"mp3\""
alias src="source ~/.zshrc"
alias ls="ls -F --color=auto"
alias ll="eza -l -g --icons"

export EDITOR="bob run nightly"
export MANPAGER="bob run nightly +Man!"

# edit command line
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
export HISTIGNORE='exit:cd:ls:bg:fg:history:f:fd:vim'

MAILSYNC_MUTE=1


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

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(starship init zsh)"

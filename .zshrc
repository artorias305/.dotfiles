export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

OS="$(uname)"

path_prepend() {
	[[ -d "$1" ]] && export PATH="$1:$PATH"
}

case "$OS" in
	Darwin)
		path_prepend /opt/homebrew/bin
		path_prepend /opt/homebrew/opt/llvm/bin
		path_prepend "$HOME/.local/bin"
		;;
	Linux)
		path_prepend "$HOME/.local/bin"

		# fnm
		FNM_PATH="$HOME/.local/share/fnm"
		if [ -d "$FNM_PATH" ]; then
			path_prepend "$FNM_PATH"
			eval "$(fnm env)"
		fi
		;;
esac

path_prepend "$HOME/.cargo/bin"

# opencode
path_prepend "$HOME/.opencode/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
path_prepend "$BUN_INSTALL/bin"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# user bin
path_prepend "$HOME/bin"

# env
export EDITOR="nvim"

eval "$(fzf --zsh)"

alias ls="eza"
alias lg="lazygit"
alias src="source ~/.zshrc"
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# nim
export PATH=/home/kiq/.nimble/bin:$PATH

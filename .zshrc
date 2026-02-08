export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

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

		# bob
		[[ -f "$HOME/.local/share/bob/env/env.sh" ]] &&
			source "$HOME/.local/share/bob/env/env.sh"
		
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
export BAT_THEME="ansi"
export ODIN_ROOT="$HOME/Odin"

export FZF_DEFAULT_OPTS="
--height=40%
--layout=reverse 
--border
--color=bg:#101010,bg+:#232323,fg:#A0A0A0,fg+:#FFFFFF,hl:#FFC799,hl+:#FFC799,pointer:#FFC799,prompt:#FFC799,info:#5C5C5C
"

eval "$(fzf --zsh)"
eval "$(starship init zsh)"

alias ll="eza -l -g --git"
alias llt="eza -1 --git --tree --git-ignore"
alias la="eza -la -g --git"
alias lg="lazygit"
alias src="source ~/.zshrc"
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

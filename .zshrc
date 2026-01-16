export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -d /opt/homebrew/bin ]]; then
        export PATH="/opt/homebrew/bin:$PATH"
    fi
    export PATH="/Users/kiq/.local/bin:$PATH"
fi

if [[ "$(uname)" == "Linux" ]]; then
	export PATH="$HOME/.local/bin:$PATH"
	. "/home/kiq/.local/share/bob/env/env.sh"
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	# fnm
	FNM_PATH="/home/kiq/.local/share/fnm"
	if [ -d "$FNM_PATH" ]; then
	  export PATH="$FNM_PATH:$PATH"
	  eval "`fnm env`"
	fi
fi

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# opencode
export PATH=/home/kiq/.opencode/bin:$PATH

export EDITOR="nvim"

alias lg="lazygit"
alias src="source ~/.zshrc"

# opencode
export PATH=/Users/kiq/.opencode/bin:$PATH

# bun completions
[ -s "/home/kiq/.bun/_bun" ] && source "/home/kiq/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias ll="eza -l -g --git"
alias llt="eza -1 --git --tree --git-ignore"


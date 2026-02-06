export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -d /opt/homebrew/bin ]]; then
        export PATH="/opt/homebrew/bin:$PATH"
    fi
    export PATH="/Users/kiq/.local/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi

if [[ "$(uname)" == "Linux" ]]; then
	export PATH="$HOME/.local/bin:$PATH"
	. "/home/kiq/.local/share/bob/env/env.sh"
	# fnm
	FNM_PATH="/home/kiq/.local/share/fnm"
	if [ -d "$FNM_PATH" ]; then
	  export PATH="$FNM_PATH:$PATH"
	  eval "`fnm env`"
	fi
fi

export PATH="$HOME/.cargo/bin:$PATH"

# opencode
export PATH=/home/kiq/.opencode/bin:$PATH

export EDITOR="nvim"

alias lg="lazygit"
alias src="source ~/.zshrc"

# bun completions
[ -s "/home/kiq/.bun/_bun" ] && source "/home/kiq/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if command -v eza &> /dev/null; then
	alias ls='eza -lg --group-directories-first --icons=auto'
	alias lt='eza --tree --level=2 --long --icons --git'
fi

eval "$(fzf --zsh)"
eval "$(starship init zsh)"

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

export PATH="$HOME/bin:$PATH"

export BAT_THEME=ansi

export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --color=bg:#101010,bg+:#232323,fg:#A0A0A0,fg+:#FFFFFF,hl:#FFC799,hl+:#FFC799,pointer:#FFC799,prompt:#FFC799,info:#5C5C5C"

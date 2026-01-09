if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

fish_add_path ~/.cargo/bin

bash -c 'source "$HOME/.local/share/bob/env/env.sh"'
starship init fish | source

alias nvim="bob run nightly"
alias ls="eza --icons"
alias ll="ls -l"
alias src="source ~/.config/fish/config.fish"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set SPACEFISH_PROMPT_ADD_NEWLINE false

starship init fish | source

alias cat="bat"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias src="source ~/.config/fish/config.fish"
alias lg="lazygit"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf --fish | source

alias src="source ~/.config/fish/config.fish"
alias lg="lazygit"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fish_add_path ~/.opencode/bin
fish_add_path ~/.cargo/bin

# fnm
set FNM_PATH "/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]
  fnm env | source
end


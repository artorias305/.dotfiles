if status is-interactive
# Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

alias cat="bat"
alias grep="rg"
alias ls="eza"
alias find="fd"

abbr -a tree "eza --tree"
abbr -a ps procs
abbr -a lg lazygit
abbr -a src "source ~/.config/fish/config.fish"

set -gx MANPAGER "nvim +Man!"

zoxide init fish | source

fish_add_path ~/.bun/bin

if status is-interactive
# Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

alias ls="eza"
alias cd="z"

abbr -a tree "eza --tree"
abbr -a ps procs
abbr -a lg lazygit
abbr -a src "source ~/.config/fish/config.fish"
abbr -a cat "bat"
abbr -a grep "rg"
abbr -a find "fd"

set -gx MANPAGER "nvim +Man!"

zoxide init fish | source

fish_add_path ~/.bun/bin
fish_add_path ~/.opencode/bin

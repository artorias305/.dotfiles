if status is-interactive
# Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

alias cd="z"

zoxide init fish | source

fish_add_path ~/.bun/bin
fish_add_path ~/.opencode/bin
fish_add_path ~/go/bin

direnv hook fish | source

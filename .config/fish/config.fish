if status is-interactive
# Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

set -g __done_min_cmd_duration 10000

set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_use_informative_chars 'yes'
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color $fish_color_normal
set -g __fish_git_prompt_color_flags $fish_color_status
set -g __fish_git_prompt_color_branch $fish_color_cwd
set -g __fish_git_prompt_char_dirtystate '~'
set -g __fish_git_prompt_char_untrackedfiles '+'
set -g __fish_git_prompt_showuntrackedfiles 'yes'
set -g __fish_git_prompt_showupstream 'no'
set -g __fish_git_prompt_show_informative_status 'no'

set -g _prompt_success_color (set_color cyan)
set -g _prompt_status_color (set_color $fish_color_status 2>/dev/null; or set_color red --bold)
set -g _prompt_user_color (set_color $fish_color_user 2>/dev/null; or set_color cyan)
set -g _prompt_cwd_color (set_color $fish_color_cwd 2>/dev/null; or set_color green)
set -g _prompt_normal (set_color normal)


abbr --add 'lg' 'lazygit'
abbr --add 'src' 'source ~/.config/fish/config.fish'
abbr --add 'cat' 'bat'

# abbr --add 'ls' 'eza -l --icons --git --no-permissions --no-filesize --no-user --no-time'
# alias ls="eza -l --icons --git --no-permissions --no-filesize --no-user --no-time"

fish_add_path ~/.opencode/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export EDITOR nvim

# starship init fish | source

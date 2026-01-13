# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim

export PATH="$HOME/.local/bin:$PATH"

PS1='[\u@\h \W]\$ '

alias src="source ~/.bashrc"

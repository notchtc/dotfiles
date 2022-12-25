# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
shopt -s autocd

source /usr/share/bash-completion/completions/herbstclient
complete -F _herbstclient_complete -o nospace hc
source "$XDG_CONFIG_HOME/aliasrc"

bind -x '"\C-l": clear'

export GPG_TTY=$(tty)

PS1='`if [[ $? -gt 0 ]]; then printf "\[\e[31m\]"; else printf "\[\e[32m\]"; fi`\
\w\[\e[0m\] '

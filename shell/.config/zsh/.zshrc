PS1="%(?.%F{green}.%F{red})%(3~|%15>…>%-2~%>>/…/%15>…>%1~|%4~)%f "
setopt autocd
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$XDG_DATA_HOME/zsh_history"

# Load aliases
source "$XDG_CONFIG_HOME/aliasrc"

# Enable completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Set vi mode
bindkey -v
# Vi keybindings in completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Change cursor shape for different vi modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt

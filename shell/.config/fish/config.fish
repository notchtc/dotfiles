if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    abbr mkdir "mkdir -p"
    source "$XDG_CONFIG_HOME/aliasrc"
    source "$XDG_CONFIG_HOME/fish/colors.fish"
end

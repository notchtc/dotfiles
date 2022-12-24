# Set XDG directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"

# Clean up ~/
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/x11/xserverrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GEM_PATH="$XDG_DATA_HOME/gem"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export LESSHISTFILE=-
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export HISTFILE="$XDG_DATA_HOME/bash_history"

# Default apps
export BROWSER=firefox
export EDITOR=nvi
export VISUAL="$EDITOR"
export PAGER=less
export TERMINAL=xst

export FZF_DEFAULT_OPTS="-m --color '16,bg+:-1,border:8' --border sharp --preview-window sharp:wrap --layout=reverse --info inline"
export LESS="--mouse -R"
export QT_STYLE_OVERRIDE=adwaita-dark

# Set path
export PATH="$PATH:$HOME/.local/bin:$GEM_PATH/bin"

. "$HOME/.bashrc"

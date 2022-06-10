# Set some XDG stuff
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DESKTOP_DIR=${XDG_DESKTOP_DIR:="$HOME/Desktop"}
export XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:="$HOME/Downloads"}
export XDG_TEMPLATES_DIR=${XDG_TEMPLATES_DIR:="$HOME/Templates"}
export XDG_PUBLICSHARE_DIR=${XDG_PUBLICHSHARE_DIR:="$HOME/Public"}
export XDG_DOCUMENTS_DIR=${XDG_DOCUMENTS_DIR:="$HOME/Documents"}
export XDG_MUSIC_DIR=${XDG_MUSIC_DIR:="$HOME/Music"}
export XDG_PICTURES_DIR=${XDG_PICTURES_DIR:="$HOME/Pictures"}
export XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:="$HOME/Videos"}
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
export EMACSDIR="$XDG_CONFIG_HOME/emacs"
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export DOOMLOCALDIR="$DOOMDIR/local"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export FVWM_USERDIR="$XDG_CONFIG_HOME/fvwm"
export LESSHISTFILE=-
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Default apps
export BROWSER=vimb
export EDITOR=nvim
export VISUAL="$EDITOR"
export PAGER=less

export FZF_DEFAULT_OPTS="-m --color '16,bg+:-1,border:8' --border sharp --preview-window sharp:wrap --layout=reverse --info inline"
export LESS="--mouse -R"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
export QT_QPA_PLATFORMTHEME=qt5ct

export LIBERICA_DIR=/usr/lib/jvm/bellsoft-java8-full-amd64

# Set path
export PATH="$PATH:$HOME/.local/bin:$GEM_HOME/bin:$XDG_CONFIG_HOME/emacs/bin:$LIBERICA_DIR/bin:$XDG_DATA_HOME/npm/bin"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx "$XDG_CONFIG_HOME/x11/xinitrc"
fi

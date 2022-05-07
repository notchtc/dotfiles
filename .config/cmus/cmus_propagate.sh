# propagate to the scrobler
cmusfm "$@"

# propagate it to polybar
polybar-msg action "#cmus.hook.0"

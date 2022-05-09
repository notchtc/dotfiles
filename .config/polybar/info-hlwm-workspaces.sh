#!/usr/bin/env bash

bg=$(xrdb -get background)
fg=$(xrdb -get foreground)
gray=$(xrdb -get color11)
color1=$(xrdb -get color9)
color2=$(xrdb -get color14)
color3=$(xrdb -get color3)
color4=$(xrdb -get color1)

# Multi monitor support. Needs MONITOR environment variable to be set for each instance of polybar
# If MONITOR environment variable is not set this will default to monitor 0
# Check https://github.com/polybar/polybar/issues/763
MON_IDX="0"
mapfile -t MONITOR_LIST < <(polybar --list-monitors | cut -d":" -f1)
for (( i=0; i<$((${#MONITOR_LIST[@]})); i++ )); do
  [[ ${MONITOR_LIST[${i}]} == "$MONITOR" ]] && MON_IDX="$i"
done;

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status "${MON_IDX}")"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '.')
                        # the tag is empty
                        # TODO Add your formatting tags
                        echo "%{F$gray}"
                        ;;
                    ':')
                        # the tag is not empty
                        # TODO Add your formatting tags
                        echo "%{F$fg}"
                        ;;
                    '+')
                        # the tag is viewed on the specified MONITOR, but this monitor is not focused.
                        # TODO Add your formatting tags
                        echo "%{F$bg}%{B$color1}"
                        ;;
                    '#')
                        # the tag is viewed on the specified MONITOR and it is focused.
                        # TODO Add your formatting tags
                        echo "%{F$bg}%{B$color2}"
                        ;;
                    '-')
                        # the tag is viewed on a different MONITOR, but this monitor is not focused.
                        # TODO Add your formatting tags
                        echo "%{F$bg}%{B$color1}"
                        ;;
                    '%')
                        # the tag is viewed on a different MONITOR and it is focused.
                        # TODO Add your formatting tags
                        echo "%{F$bg}%{B$color3}"
                        ;;
                    '!')
                        # the tag contains an urgent window
                        # TODO Add your formatting tags
                        echo "%{F$bg}%{B$color4}"
                        ;;
                esac

                # focus the monitor of the current bar before switching tags
                echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:}%{O10}${i:1}%{O10}%{A -u -o F- B-}"
            done

            # reset foreground and background color to default
            echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null

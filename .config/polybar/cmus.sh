#!/usr/bin/env bash
status=$(cmus-remote -Q | grep status | cut -d " " -f2-)
title=$(cmus-remote -C status | grep title | cut -c11-)

if [ "$status" = "playing" ]; then
    icon=""
elif [ "$status" = "paused" ]; then
    icon=""
else
    icon=""
fi

title_count=$(echo "$title" | wc -L)

if [ "$title_count" -ge 36 ]; then
    printf "%s %.36s..." "$icon" "$title"
else
    printf "%s %s" "$icon" "$title"
fi

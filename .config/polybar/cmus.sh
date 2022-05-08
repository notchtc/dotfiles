#!/usr/bin/env bash
status=$(cmus-remote -Q | grep status | cut -c8-)
title=$(cmus-remote -Q | grep title | cut -c11-)

if [ "$status" = "playing" ]; then
    icon=""
elif [ "$status" = "paused" ]; then
    icon=""
else
    exit
fi

printf "%s %s" "${title:0:30}" "$icon"

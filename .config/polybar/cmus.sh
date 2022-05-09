#!/usr/bin/env bash
status=$(cmus-remote -Q 2>/dev/null | grep -m1 '^status' | cut -c8-)
title=$(cmus-remote -Q 2>/dev/null | grep -m1 '^tag title' | cut -c11-)

if [ "$status" = "playing" ]; then
    icon=""
elif [ "$status" = "paused" ]; then
    icon=""
else
    exit
fi

printf "%s %s " "${title:0:30}" "$icon"

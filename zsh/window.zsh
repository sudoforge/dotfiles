#!/usr/bin/env zsh

case $TERM in
    *xterm*|*rxvt*|*screen*)
        function precmd() {
            # Print a newline before the prompt, unless it's the first
            # prompt in the parent process.
            if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
                NEW_LINE_BEFORE_PROMPT=1
            elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
                print ""
            fi
        }
esac

#!/usr/bin/env zsh

case $TERM in
    *xterm*|*rxvt*|*screen*)
        # Special function precmd, executed before displaying each prompt.
        function precmd() {
            # Set the terminal title to the current working directory.
            print -Pn "\e]0;%n@%m:%~\a"

            # Print a newline before the prompt, unless it's the first
            # prompt in the parent process.
            if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
                NEW_LINE_BEFORE_PROMPT=1
            elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
                print ""
            fi
        }

        # Special function preexec, executed before running each command.
        function preexec() {
            # Set the terminal title to the curently running command.
            print -Pn "\e]2;[${2:q}]\a"
        }
esac

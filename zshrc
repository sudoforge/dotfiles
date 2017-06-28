#!/usr/bin/env zsh

# attach to or create a tmux session
if command -v tmux > /dev/null 2>&1 && [ -z "$TMUX" ]; then
    if command tmux list-sessions > /dev/null 2>&1; then
        exec tmux attach
    else
        exec tmux new-session
    fi
fi

# shortcut to dotfiles
export ZSHFILES="$HOME/.zsh"

log() {
    preLabel="dotfiles: zsh"

    case "$1" in
        info)
            echo "${preLabel}: info: ${*:2}"
            ;;
        error)
            echo "${preLabel}: error: ${*:2}"
            ;;
        fatal)
            echo "${preLabel}: fatal: ${*:2}"
            exit 1
            ;;
        *)
            log error "unsupported label: '$1'"
            ;;
    esac
}


if [ ! -d "$ZSHFILES" ]; then
    __log error "missing directory '\$HOME/.zsh'"
    __log error "aborting shell configuration."
    return
fi


# get all files with .zsh extension
script_files=("$ZSHFILES"/*.zsh)


# Autoload functions
autoload -Uz spectrum && spectrum
autoload -Uz wo
autoload -Uz mp


# load everything except completion files
for file in ${script_files:#*/completion.zsh}; do
  . "$file"
done


# load completion after autocomplete loads
. "${ZSHFILES}/completion.zsh"


unset script_files
unset ZSHFILES

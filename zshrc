#!/usr/bin/env zsh

# .zshrc: Configuration for ZSH

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


# source the env file
. "${ZSHFILES}/env.zsh"


# load everything except env and completion files
for file in ${${script_files:#*/env.zsh}:#*/completion.zsh}; do
  . "$file"
done


# load completion after autocomplete loads
. "${ZSHFILES}/completion.zsh"


unset script_files
unset ZSHFILES

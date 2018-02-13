#!/usr/bin/env zsh

autoload -Uz compinit && compinit

zstyle ':completion:*' list-colors "${LS_COLORS}" # Complete with same colors as ls.
zstyle ':completion:*' max-errors 2 # Be lenient to 2 errors.
zstyle ':completion:*' completer _expand _complete _correct _approximate # Completion modifiers.
zstyle ':completion:*' use-cache true # Use a completion cache.
zstyle ':completion:*' ignore-parents pwd # Ignore the current directory in completions.

third_party_scripts() {
    # AWS CLI completer
    local aws_cli_completion="$(dirname $(which aws))/aws_zsh_completer.sh"
    if [ -e "${aws_cli_completion}" ]; then
        . "${aws_cli_completion}"
    fi
}
third_party_scripts

# attach to or create a tmux session
if command -v tmux > /dev/null 2>&1 && [ -z "$TMUX" ]; then
    if command tmux list-sessions > /dev/null 2>&1; then
        exec tmux attach
    else
        exec tmux new-session -s main
    fi
fi

# shortcut to dotfiles
export ZSHFILES="$HOME/.zsh"


__log() {
    preLabel="dotfiles: zsh"

    case "$1" in
        info)
            echo "${preLabel}: info: ${@:2}"
            ;;
        error)
            echo "${preLabel}: error: ${@:2}"
            ;;
        fatal)
            echo "${preLabel}: fatal: ${@:2}"
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
autoload -Uz polybar-launch
autoload -Uz tbuf


# load script files
for file in ${script_files}; do
  . "$file"
done


# WINDOW CONFIGURATION
###############################
case $TERM in
    *xterm*|*rxvt*|*screen*)
        function precmd() {
            # Print a newline before the prompt, unless it's the first
            # prompt in the parent process.
            if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
                NEW_LINE_BEFORE_PROMPT=1
            elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
                echo "\n"
            fi
        }
esac


# COMMAND COMPLETION
###############################

# Enable completion
autoload -Uz compinit && compinit

# Completion configuration
zstyle ':completion:*' list-colors "${LS_COLORS}" # Complete with same colors as ls.
zstyle ':completion:*' max-errors 2 # Be lenient to 2 errors.
zstyle ':completion:*' completer _expand _complete _correct _approximate # Completion modifiers.
zstyle ':completion:*' use-cache true # Use a completion cache.
zstyle ':completion:*' ignore-parents pwd # Ignore the current directory in completions.

# helper functions for sourcing files
__source() {
    [ -e "$1" ] && . "$1"
}

__sourceFirst() {
    for f in "$@"; do
        if __source "$f"; then
            break
        fi
    done
}

# Source completion scripts
__source "/usr/bin/aws_zsh_completer.sh"
__source "/opt/google-cloud-sdk/completion.zsh.inc"

# Terraform completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Fish-like autosuggestions
# The list below supports the default locations for the following:
#   * Arch Linux package `community/zsh-autosuggestions`
#   * Homebrew recipe `zsh-autosuggestions`
#   * README-example location ~/.zsh/zsh-autosuggestions
__sourceFirst \
    "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"


# ALIASES
###############################

alias ...=../..
alias cls="clear"
alias dirs="dirs -v"
alias gcp="gcloud"
alias gpgl="gpg2 --list-keys --keyid-format long --with-fingerprint"
alias kc='kubectx'
alias kn='kubens'
alias l="ls --color=tty --group-directories-first -AlFh"
alias ll="ls --color=tty --group-directories-first -AlFhL"
alias makesrcinfo="makepkg --printsrcinfo > .SRCINFO"
alias pacr='sudo pacman -R'
alias pacs='sudo pacman -S'
alias reload=". ~/.zshrc"
alias tf='terraform'


unset script_files
unset ZSHFILES

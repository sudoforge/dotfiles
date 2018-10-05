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
autoload -Uz colors && colors
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
    *xterm*|*rxvt*|*screen*|*tmux*)
        function precmd() {
            # Print a newline before the prompt, unless it's the first
            # prompt in the parent process.
            if [ -z "$NEWLINE_BEFORE_PROMPT" ]; then
                NEWLINE_BEFORE_PROMPT=1
            elif [ "$NEWLINE_BEFORE_PROMPT" -eq 1 ]; then
                echo ""
            fi
        }

        function preexec() {
            gpg-connect-agent updatestartuptty /bye &> /dev/null
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
zstyle ':completion:*' rehash true # automatically find new executables in $PATH

# helper functions for sourcing files
__source() {
    [ -e "$1" ] && . "$1"
}

__sourceFirst() {
    for f in "$@"; do
        __source "$f" && break
    done
}

# Source completion scripts
__source "/usr/bin/aws_zsh_completer.sh"
__source "/opt/google-cloud-sdk/completion.zsh.inc"

# Bash completions
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/share/bash-completion/completions/lxc lxc
complete -o nospace -C /usr/share/bash-completion/completions/lxd lxd

# Fish-like autosuggestions
# The list below supports the default locations for the following:
#   * Arch Linux package `community/zsh-autosuggestions`
#   * Homebrew recipe `zsh-autosuggestions`
#   * README-example location ~/.zsh/zsh-autosuggestions
__sourceFirst \
    "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlighting
__source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# ALIASES
###############################

alias ...=../..
alias chat='tmux set-buffer -b weechat $(gopass weechat) && weechat'
alias cls="unset NEWLINE_BEFORE_PROMPT && clear"
alias dirs="dirs -v"
alias gcp="gcloud"
alias gpgl="gpg --list-keys --keyid-format long --with-fingerprint"
alias gpgll="gpg --list-keys --keyid-format long --with-fingerprint --with-subkey-fingerprint"
alias kc='kubectx'
alias kn='kubens'
alias ku='kubectl'
alias l="ls --color=tty --group-directories-first -AlFh"
alias ll="ls --color=tty --group-directories-first -AlFhL"
alias makesrcinfo="makepkg --printsrcinfo > .SRCINFO"
alias pass='gopass'
alias reload=". ~/.zshrc"
alias se='sudoedit'
alias tf='terraform'


unset script_files
unset ZSHFILES

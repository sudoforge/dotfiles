# Tmux initialization
#
# If tmux is installed and available to the current shell, run new-session with
# the -A flag; this will force tmux to attach to the named session if it exists,
# or create it if it doesn't. This ensures that I always start in a session with
# the specified name.
################################################################################
if command -v tmux > /dev/null 2>&1 && [ -z "${TMUX+x}" ] && [ ! "$UID" -eq 0 ]; then
    tmux new-session -A -s main
fi

# set NVIM_LISTEN_ADDRESS for neovim-remote
#
# if tmux is installed and we're in a tmux session, then set the value to one
# that is unique per user and window, so that each invocation of neovim-remote
# by the same user within the same window will utilize the same address.
#
# otherwise, set the address to one that is unique per user.
if command -v nvr > /dev/null 2>&1; then
    if command -v tmux > /dev/null 2>&1 && [ -n "$TMUX" ]; then
        export NVIM_LISTEN_ADDRESS="/tmp/nvim.${USER}.${$(tmux display -p '#{window_id}')#@}"
    else
        export NVIM_LISTEN_ADDRESS="/tmp/nvim.${USER}"
    fi
fi

# Autoload functions
#
# "autoload" is a built-in ZSH command that does nothing but register the named
# targets as functions. The named targets are regular files found within a
# directory listed in the FPATH environment variable. The ultimate goal of
# loading functions/scripts/etc using `autoload` is to reduce the burden of
# sourcing files (make the shell's startup faster).
#
# By convention, the targets starting with two underscores are helper functions
# used within my ZSH environment.
################################################################################
autoload -Uz __fzf-history-widget
autoload -Uz __git_prompt_status
autoload -Uz __log
autoload -Uz __maybe
autoload -Uz __short_cwd
autoload -Uz chat
autoload -Uz colors && colors
autoload -Uz edit-command-line
autoload -Uz for-each-dir
autoload -Uz insert-composed-char
autoload -Uz mp
autoload -Uz spectrum && spectrum
autoload -Uz tbuf
autoload -Uz updatestartuptty
autoload -Uz wo


# Prompt configuration
################################################################################
PROMPT_CHAR="➜"
PROMPT="\$(__short_cwd)\$(__git_prompt_status)"
PROMPT="${PROMPT}"$'\n'"%(?..%{$FX[reset]$FG[203]%})$FX[reset]${PROMPT_CHAR} "


# Options
################################################################################
setopt APPEND_HISTORY               # Don't overwrite history.
setopt AUTO_CD                      # Automatically cd in to directories if it's not a command name.
setopt AUTO_LIST                    # Always automatically show a list of ambiguous completions.
setopt AUTO_PUSHD                   # Automatically push visited directories to the stack.
setopt COMPLETE_IN_WORD             # Complete items from the beginning to the cursor.
setopt EXTENDED_GLOB                # Give meaning to lots of crazy characters.
setopt EXTENDED_HISTORY             # Remember all sorts of stuff about the history.
setopt HIST_IGNORE_ALL_DUPS         # Ignore all duplicate entries in the history.
setopt HIST_IGNORE_SPACE            # Ignore commands with leading spaces.
setopt HIST_REDUCE_BLANKS           # Tidy up commands before comitting them to history.
setopt HIST_VERIFY                  # Verify commands that use a history expansion.
setopt INC_APPEND_HISTORY_TIME      # Record how long each command took (use `history -D` to view)
setopt INTERACTIVE_COMMENTS         # Allow me to comment lines in an interactive shell.
setopt LOCAL_OPTIONS                # Options set/unset inside functions, stay within the function.
setopt NO_BEEP                      # Never, ever, beep at me.
setopt PROMPT_SUBST                 # Expand parameters within prompts.
setopt PUSHD_IGNORE_DUPS            # Don't duplicate directories in the dirstack.
setopt PUSHD_SILENT                 # Don't print out the directory stack after pushd or popd
setopt RM_STAR_SILENT               # Do not wait for confirmation of 'rm *' or 'rm path/*'
setopt SHARE_HISTORY                # Write to the histfile immediately


# ZLE
################################################################################
zle -N __fzf-history-widget
zle -N edit-command-line
zle -N insert-composed-char


# Keybindings
################################################################################

# Delete existing keymaps and reset to default state
bindkey -d

# Select viins (vi-mode) keymap and bind it to main
bindkey -v

# Keybindings, sorted by key
bindkey "^?" backward-delete-char
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^L" clear-screen
bindkey "^R" __fzf-history-widget
bindkey "^U" kill-whole-line
bindkey "^V" quoted-insert
bindkey "^W" delete-word
bindkey "^[[3~" delete-char
bindkey "^[[C" forward-char
bindkey "^[[D" backward-char
bindkey "^[w" backward-delete-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[Z' reverse-menu-complete
bindkey '^n' down-line-or-history
bindkey '^p' up-line-or-history


# WINDOW CONFIGURATION
################################################################################
case $TERM in
    *xterm*|*rxvt*|*screen*|*tmux*)
        function precmd() {
            # Print a newline before the prompt, unless it's the first
            # prompt in the parent process.
            if [ -z "${NEWLINE_BEFORE_PROMPT+x}" ]; then
                NEWLINE_BEFORE_PROMPT=1
            else
              printf "\n\n"
            fi
        }

        function preexec() {
            updatestartuptty
        }
esac

# initial update of gpg-agent's startup tty
updatestartuptty


# COMMAND COMPLETION
################################################################################

# Enable completion
autoload -Uz compinit && compinit

# Completion configuration
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.cache/zsh/completion
zstyle ':completion:*' ignore-parents pwd
zstyle ':completion:*' rehash true

# Source completion scripts
__maybe "/usr/bin/aws_zsh_completer.sh"
__maybe \
  "/opt/google-cloud-sdk/completion.zsh.inc" \
  "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Completion functions
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/share/bash-completion/completions/lxc lxc
complete -o nospace -C /usr/share/bash-completion/completions/lxd lxd
complete -o nospace -C /usr/bin/vault vault

# hostsctl
__maybe /usr/share/bash-completion/completions/hostsctl

# Fish-like autosuggestions
# The list below supports the default locations for the following:
#   * Arch Linux package `community/zsh-autosuggestions`
#   * Homebrew recipe `zsh-autosuggestions`
#   * README-example location ~/.zsh/zsh-autosuggestions
__maybe \
    "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# set the autosuggestion color to something visible with solarized dark
# unable to set in zshenv due to upstream issue:
# https://github.com/zsh-users/zsh-autosuggestions/issues/381
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# Syntax highlighting
__maybe "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# ALIASES
################################################################################

alias ..=../
alias ...=../../
alias ....=../../../
alias b='bazel'
alias cdd='cd $(mktemp -d)'
alias chat='weechat'
alias cls="unset NEWLINE_BEFORE_PROMPT && clear"
alias copybara="copybara --output-root ~/.cache/copybara"
alias diff='diff -urN --color'
alias dls="dirs -v"
alias e="nvr -s"
alias exif="exiv2"
alias gcp="gcloud"
alias gcs="gsutil"
alias gpgl="gpg --list-keys --keyid-format long --with-fingerprint"
alias gpgll="gpg --list-keys --keyid-format long --with-fingerprint --with-subkey-fingerprint"
alias k='kubectl'
alias kc='kubectx'
alias kn='kubens'
alias ku='kubectl'
alias l="ls --color=tty --group-directories-first -AlFh"
alias ll="ls --color=tty --group-directories-first -AlFhL"
alias pass='EDITOR="nvr -s --remote-wait" gopass'
alias qb='qutebrowser'
alias reload=". ~/.zshrc"
alias rg="\rg --ignore-file ~/.ignore"
alias se='EDITOR="nvr -s --remote-wait" sudoedit'
alias tf='terraform'
alias tg='terragrunt'
alias top='btm --battery -glT'
alias userctl='systemctl --user'
alias userjrnl='journalctl --user'
alias vim='e'

# local configuration
#
# To enable configuration on a per-host basis, optionally source ~/.zshrc.local.
# This allows for overriding or setting new values at will. This is used, as an
# example, on my machine at $WORK, to set environment variables that are not
# otherwise used.
################################################################################
__maybe "${HOME}/.zshrc.local"

#########################
# GENERAL
#########################

# Set the current tty for GPG_TTY
export GPG_TTY=$(tty)

# General vars
export EDITOR=nvim
export DIFFPROG='nvim -d'
export BROWSER=qutebrowser
export XDG_CONFIG_HOME="$HOME/.config"
export MANPAGER='nvim +Man!'


#########################
# UTILIES AND TOOLS
#########################

# [golang]
export GOPATH="${HOME}/.go"

# [misc]
export WOPATH="${HOME}/code"

# [ripgrep]
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc

# [python]
export PIPENV_VENV_IN_PROJECT="enabled"

# [fzf]
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-file ${HOME}/.ignore"


#########################
# ZSH OPTIONS
#########################

# history settings
export SAVEHIST=20000
export HISTSIZE=20000
export HISTFILE="${HOME}/.cache/zsh/history"

# Display time and usage for long-running commands
export REPORTTIME=5

# adjust multi-character sequence delay
export KEYTIMEOUT=1


#########################
# PATH MANAGEMENT
#########################

# PATH is set in zprofile

# Add local function directory to FPATH for autoloading
FPATH="${HOME}/.local/share/zsh/functions:${FPATH}"

# Add local completion directory to FPATH for automatic pickup
FPATH="${HOME}/.local/share/zsh/completions:${FPATH}"

##### DO NOT EDIT BELOW THIS LINE ##################################################################

# Enable extending this configuration by sourcing ~/.zshenv.local, if it exists
[ -f "${HOME}/.zshenv.local" ] && . "${HOME}/.zshenv.local"

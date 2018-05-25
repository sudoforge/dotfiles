#########################
# GENERAL
#########################

# Set the current tty for GPG_TTY
export GPG_TTY=$(tty)

# General vars
export EDITOR=vim
export BROWSER=firefox
export XDG_CONFIG_HOME="$HOME/.config"


#########################
# UTILIES AND TOOLS
#########################

# [golang]
export GOPATH="${HOME}/code"
export PATH_GO_BIN="${GOPATH}/bin"

# [rust/cargo]
export CARGOPATH="${HOME}/.cargo"
export PATH_CARGO_BIN="${CARGOPATH}/bin"

# [yarn]
export PATH_YARN_BIN="${HOME}/.yarn/bin"

# [python] location for user-installed site packages
export PYTHONUSERBASE="${HOME}/.local"
export PATH_PIP_BIN="${PYTHONUSERBASE}/bin"

# [misc]
export WOPATH="${GOPATH}/src" # for easy project switching

#########################
# ZSH OPTIONS
#########################

# history settings
export SAVEHIST=5000
export HISTSIZE=5000
export HISTFILE="${HOME}/.zsh_history"

# Display time and usage for long-running commands
export REPORTTIME=5


#########################
# PATH MANAGEMENT
#########################

# PATH is set in zprofile

# Add functions and completion scripts
FPATH="${HOME}/.functions:${FPATH}"

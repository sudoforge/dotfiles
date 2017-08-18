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
export GO_BIN="${GOPATH}/bin"

# [rust/cargo]
export CARGOPATH="${HOME}/.cargo"
export CARGO_BIN="${CARGOPATH}/bin"

# [yarn]
export YARN_GLOBAL_BIN="${HOME}/.config/yarn/global/node_modules/.bin"

# [python] location for user-installed site packages
export PYTHONUSERBASE="${HOME}/.local"
export PIP_BIN="${PYTHONUSERBASE}/bin"

# [python] Settings for virtualenvwrapper
export WORKON_HOME="${HOME}/.virtualenvs"
export PROJECT_HOME="${GOPATH}/src"


#########################
# ZSH OPTIONS
#########################

# [zsh] history settings
export SAVEHIST=1000
export HISTSIZE=1000
export HISTFILE="${HOME}/.zsh_history"

# [zsh] Display time and usage for long-running commands
export REPORTTIME=5


#########################
# PATH MANAGEMENT
#########################

# PATH is set in zprofile

# Add functions and completion scripts
FPATH="${HOME}/.functions:${FPATH}"

#!/usr/bin/env zsh

# environment.zsh: Sets up environment variables and settings.


#########################
# GENERAL
#########################
umask 022

# Set the current tty for GPG_TTY
export GPG_TTY=$(tty)

# Auto-eval ssh-agent if PID is not found
if [ -z "$SSH_AGENT_PID" ]; then eval $(ssh-agent) > /dev/null 2>&1; fi

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

# [general] Standard environment variables
export EDITOR=vim
export BROWSER=firefox
export XDG_CONFIG_HOME="$HOME/.config"

# [zsh] history settings
export SAVEHIST=1000
export HISTSIZE=1000
export HISTFILE="${HOME}/.zsh_history"

# [zsh] Display time and usage for long-running commands
export REPORTTIME=5



#########################
# PATH MANAGEMENT
#########################

# Installed via `pip install --user` or `pipsi install`
PATH="${PIP_BIN}:${PATH}"

# For things installed via cargo
PATH="${CARGO_BIN}:${PATH}"

# Installed via `go get`
PATH="${GO_BIN}:${PATH}"

# Installed via `yarn global add`
PATH="${YARN_GLOBAL_BIN}:${PATH}"

# Add functions and completion scripts
FPATH="${HOME}/.functions:${FPATH}"


#########################
# AUTOLOADING
#########################
autoload -Uz spectrum && spectrum
autoload -Uz wo

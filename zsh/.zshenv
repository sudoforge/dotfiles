#########################
# GENERAL
#########################

# Set the current tty for GPG_TTY
export GPG_TTY=$(tty)

# General vars
export EDITOR='nvr -s'
export DIFFPROG='nvr -s -d'
export BROWSER=qutebrowser
export XDG_CONFIG_HOME="${HOME}/.config"
export MANPAGER="nvr -s -c 'Man!' -"


#########################
# UTILIES AND TOOLS
#########################

export CHROME_EXECUTABLE=chromium
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-file ${HOME}/.ignore"
export GIT_EDITOR='nvr -s --remote-wait'
export GOPATH="${HOME}/.go"
export LESS='-XFRi'
export PIPENV_VENV_IN_PROJECT="enabled"
export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/ripgreprc"
export WOPATH="${HOME}/code"


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

# Enable extending this configuration by sourcing $HOME/.zshenv.local, if it exists
[ -f "${HOME}/.zshenv.local" ] && . "${HOME}/.zshenv.local"

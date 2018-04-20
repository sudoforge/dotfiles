#!/usr/bin/env zsh


# load zgen
PLUGIN_MANAGER_DIR="${HOME}/.zplug"
PLUGIN_MANAGER_SRC="init.zsh"
if [ -d "${PLUGIN_MANAGER_DIR}" ]; then
    . "${PLUGIN_MANAGER_DIR}/${PLUGIN_MANAGER_SRC}"
else
    echo "dotfiles: info: plugin manager not found. installing to ${PLUGIN_MANAGER_DIR}"
    if command -v git > /dev/null 2>&1; then
        if command git clone \
            https://github.com/zplug/zplug.git "${PLUGIN_MANAGER_DIR}" > /dev/null 2>&1; then
            . "${PLUGIN_MANAGER_DIR}/${PLUGIN_MANAGER_SRC}"
        fi
    fi
fi
unset PLUGIN_MANAGER_SRC
unset PLUGIN_MANAGER_DIR

if command -v zplug > /dev/null 2>&1; then
    # lazy loading for lukechilds/zsh-nvm
    export NVM_LAZY_LOAD=true
    zplug "lukechilds/zsh-nvm", \
        depth:1

    # fish-like auto suggestions
    # defer:2 makes this run after compinit
    zplug "zsh-users/zsh-autosuggestions", \
        depth:1, \
        defer:2

    # command coloring
    zplug "zsh-users/zsh-syntax-highlighting", \
        depth:1, \
        defer:2

    # Utilities and tools
    zplug "VundleVim/Vundle.vim", \
        depth:1, \
        hook-build:"\\
            mkdir -p ${HOME}/.vim/bundle && \\
            rsync --recursive --delete . ${HOME}/.vim/bundle/Vundle.vim"

    zplug "docker/machine", \
        from:gh-r, \
        as:command, \
        use:"*docker-machine-`uname -s`-`uname -m`", \
        rename-to:docker-machine

    zplug "docker/compose", \
        from:gh-r, \
        as:command, \
        use:"*docker-compose-`uname -s`-`uname -m`", \
        rename-to:docker-compose

    TPM_DIR="~/.tmux/plugins/tpm"
    zplug "tmux-plugins/tpm", \
        depth:1, \
        if:"command -v tmux", \
        hook-build:"\\
            mkdir -p ${TPM_DIR} && \\
            rsync --recursive --delete . ${TPM_DIR}"
    unset TMP_DIR


    # Container CLI tools
    zplug "containerly/cli-tools", \
        depth:1, \
        as:command, \
        use:'components/(composer|createrepo)'

    # Command completion
    zplug "felixr/docker-zsh-completion", \
        depth:1, \
        use:contrib/completion/zsh

    # Git extensions
    zplug "bddenhartog/gitscript", \
        depth:1, \
        as:command, \
        use:'git-*/git-*'


    if ! zplug check; then
        zplug check --verbose
        printf "Install? [y/N]: "
        if read -q; then
            echo && zplug install
        fi
    fi

    zplug load
fi

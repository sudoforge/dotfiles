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
            rsync --recursive --delete --exclude='.git' . ${HOME}/.vim/bundle/Vundle.vim"

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


    # Gnome extensions
    EXTENSION_DIR="~/.local/share/gnome-shell/extensions"

    zplug "micheleg/dash-to-dock", \
        depth:1, \
        if:"command -v gnome-shell", \
        hook-build:"make install"

    zplug "phocean/TopIcons-plus", \
        depth:1, \
        if:"command -v gnome-shell", \
        hook-build:"make install"

    zplug "HROMANO/nohotcorner", \
        depth:1, \
        if:"command -v gnome-shell", \
        hook-build:"\\
            mkdir -p ${EXTENSION_DIR} && \\
            rsync --recursive --delete --exclude='.git' . ${EXTENSION_DIR}/nohotcorner@azuri.free.fr"

    zplug "Tudmotu/gnome-shell-extension-bettervolume", \
        depth:1, \
        if:"command -v gnome-shell", \
        hook-build:"\\
            mkdir -p ${EXTENSION_DIR} && \\
            rsync --recursive --delete --exclude='.git' . ${EXTENSION_DIR}/bettervolume@tudmotu.com"

    unset EXTENSION_DIR


    # Container CLI tools
    zplug "containerly/cli-tools", \
        depth:1, \
        as:command, \
        use:'components/*'

    # Command completion
    zplug "felixr/docker-zsh-completion", \
        depth:1, \
        use:contrib/completion/zsh

    zplug "hashicorp/terraform", \
        depth:1, \
        use:contrib/zsh-completion/_terraform

    # Git extensions
    zplug "bddenhartog/git-scripts", \
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

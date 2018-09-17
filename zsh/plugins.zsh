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
    # Git extensions
    zplug "sudoforge/gitscript", \
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

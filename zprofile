umask 022
PATH="${PATH_YARN_BIN}:${PATH_GO_BIN}:${PATH_CARGO_BIN}:${PATH_PIP_BIN}:${PATH}"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

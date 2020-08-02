umask 022
command -v go &> /dev/null && PATH="$(go env GOPATH)/bin:${PATH}"
command -v cargo &> /dev/null && PATH="${HOME}/.cargo/bin:${PATH}"
PATH="${HOME}/.local/bin:${PATH}"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

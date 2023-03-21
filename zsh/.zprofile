
command -v go &> /dev/null && PATH="$(go env GOPATH)/bin:${PATH}"
command -v cargo &> /dev/null && PATH="${HOME}/.cargo/bin:${PATH}"
command -v kubectl-krew &>/dev/null && PATH="${HOME}/.krew/bin:${PATH}"
PATH="${HOME}/.local/bin:${PATH}"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

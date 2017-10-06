# Reuse the same ssh-agent for all shells
# -S conditional: true if file exists and is a socket
if [ ! -S "${HOME}/.ssh/ssh-agent.sock" ]; then
    eval $(ssh-agent) > /dev/null 2>&1
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh-agent.sock
fi


# This should be set in zlogin as opposed to zshenv since zlogin is sourced
# # _after_ zshenv and the real value for SSH_AUTH_SOCK (the actual ssh-agent
# socket) is needed for creating the symlink during the login process
export SSH_AUTH_SOCK="${HOME}/.ssh/ssh-agent.sock"

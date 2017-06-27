#!/usr/bin/env zsh


# Kill ssh-agent
[ -n "$SSH_AUTH_SOCK" ] && eval $(ssh-agent -k)

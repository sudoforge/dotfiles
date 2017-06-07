#!/usr/bin/env zsh

# aliases.zsh: Useful aliases for working in the terminal

# Generic aliases
alias l="ls --color=tty --group-directories-first -AlFh"
alias ll="ls --color=tty --group-directories-first -AlFhL"
alias reload=". ~/.zshrc"
alias cls="clear"
alias ...=../..

# Environment-specific
alias wg="cd ${PROJECT_HOME}/github.com"
alias wb="cd ${PROJECT_HOME}/bitbucket.org"

# Application-specific
alias gulp="./node_modules/.bin/gulp"
alias gpgl="gpg2 --list-keys --keyid-format long --with-fingerprint"
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -R'

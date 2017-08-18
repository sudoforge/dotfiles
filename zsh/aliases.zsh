#!/usr/bin/env zsh

# Generic aliases
alias l="ls --color=tty --group-directories-first -AlFh"
alias ll="ls --color=tty --group-directories-first -AlFhL"
alias reload=". ~/.zshrc"
alias cls="clear"
alias ...=../..

# Application-specific
alias gulp="./node_modules/.bin/gulp"
alias gpgl="gpg2 --list-keys --keyid-format long --with-fingerprint"
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -R'

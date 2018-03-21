#!/usr/bin/env zsh

# zle.zsh: Keybindings


typeset -g -A key

key[ShiftTab]='^[[Z'
key[Backspace]='^?'
key[CtrlBackspace]='^H'

key[Insert]='^[[2~'
key[Home]='^[[7~'
key[PageUp]='^[[5~'
key[Delete]='^[[3~'
key[AltDelete]='^[[3;3~'
key[CtrlDelete]='^[[3;5~'
key[End]='^[[8~'
key[PageDown]='^[[6~'

key[Up]='^[[A'
key[Left]='^[[D'
key[CtrlLeft]='^[[1;5D'
key[ShiftLeft]='^[[1;2D'
key[Down]='^[[B'
key[Right]='^[[C'
key[CtrlRight]='^[[1;5C'
key[ShiftRight]='^[[1;2C'


# Create some blank keymaps to play with.
bindkey -N sins .safe
bindkey -N scmd .safe


# Load required widgets
autoload insert-composed-char
autoload edit-command-line

zle -N edit-command-line
zle -N insert-composed-char


# Let the binding begin.
bindkey "$key[Delete]" delete-char
bindkey "$key[Backspace]" backward-delete-char

bindkey "^W" delete-word
bindkey "^[w" backward-delete-word

bindkey "$key[Right]" forward-char
bindkey "$key[Left]" backward-char

bindkey "$key[CtrlRight]" forward-word
bindkey "$key[CtrlLeft]" backward-word

bindkey "$key[Up]" up-line-or-history
bindkey "$key[Down]" down-line-or-history

bindkey "$key[ShiftTab]" reverse-menu-complete

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

bindkey "^S" history-incremental-search-forward 
bindkey "^V" quoted-insert

bindkey "^U" kill-whole-line

bindkey "^L" clear-screen

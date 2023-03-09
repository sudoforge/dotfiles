#!/usr/bin/env bash

# This file contains BSPC commands to create rules for nodes when connected to
# my machine's native display.

bspc rule -r filepicker:\*
bspc rule -a filepicker:filepicker:\* state=floating rectangle=1200x800+510+352

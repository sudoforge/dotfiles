#!/usr/bin/env bash

# This file contains BSPC commands to create rules for nodes when connected to
# my machine's native display.

bspc rule -a Alacritty:filepicker:\* state=floating rectangle=1000x600+460+240

#!/usr/bin/env bash

# This file contains BSPC commands to create rules for nodes when my workstation
# is docked and using an external display.

bspc rule -a filepicker:filepicker:\* state=floating rectangle=1000x600+780+420

#!/usr/bin/env bash

config="${HOME}/.Xmodmap"

if command -v xmodmap 2>&1 > /dev/null && [ -f "$config" ]; then
    xmodmap "$config"
fi

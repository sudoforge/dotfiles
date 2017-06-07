#!/usr/bin/env zsh

# options.zsh: Set Z-Shell options.
# Reference: http://zsh.sourceforge.net/Doc/Release/Options.html

# Changing Directories
setopt AUTO_CD                      # Automatically cd in to directories if it's not a command name.
setopt AUTO_PUSHD                   # Automatically push visited directories to the stack.
setopt PUSHD_IGNORE_DUPS            # ...and don't duplicate them.
setopt PUSHD_SILENT                 # Don't print out the directory stack after pushd or popd

# History Options
setopt APPEND_HISTORY               # Don't overwrite history.
setopt HIST_VERIFY                  # Verify commands that use a history expansion.
setopt EXTENDED_HISTORY             # Remember all sorts of stuff about the history.
setopt SHARE_HISTORY                # Write to the histfile immediately
setopt HIST_IGNORE_SPACE            # Ignore commands with leading spaces.
setopt HIST_IGNORE_ALL_DUPS         # Ignore all duplicate entries in the history.
setopt HIST_REDUCE_BLANKS           # Tidy up commands before comitting them to history.

# Completion Options
setopt AUTO_LIST                    # Always automatically show a list of ambiguous completions.
setopt COMPLETE_IN_WORD             # Complete items from the beginning to the cursor.
setopt NO_BEEP                      # Never, ever, beep at me.
setopt PROMPT_SUBST                 # Expand parameters within prompts.
setopt LOCAL_OPTIONS                # Options set/unset inside functions, stay within the function.
setopt INTERACTIVE_COMMENTS         # Allow me to comment lines in an interactive shell.

# Input/Output
setopt RM_STAR_SILENT               # Do not wait for confirmation of 'rm *' or 'rm path/*'

# Expansion and Globbing
setopt EXTENDED_GLOB                # Give meaning to lots of crazy characters.

# setopt RM_STAR_WAIT               # Wait and ask for confirmation on 'rm *' or 'rm path/*'
# setopt MULTIBYTE
# unsetopt FLOW_CONTROL

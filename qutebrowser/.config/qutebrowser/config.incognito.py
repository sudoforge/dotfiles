#!/usr/bin/env python3

import pathlib

# Source the base configuration file. In order to do this, we first need to
# get the path to the real configuration directory, where the base config.py and
# other configuration files (such as this one) live.
#
# Loading the base configuration file makes the `c` and `config` objects
# available, and sets the same configuration values (e.g. keybindings, settings,
# etc) as the main configuration file. We do this to maintain consistency across
# this profile and the base profile, overriding values as needed.
baseConfigDir = pathlib.Path(__file__).parent.absolute()
baseConfig = f"{baseConfigDir}/config.py"
config.source(baseConfig)

# Set the tab colors to different shades of purple, to more easily identify that
# this is the "incognito" profile.
c.colors.tabs.bar.bg = "#7A378B"
c.colors.tabs.selected.odd.bg = "#7A378B"


-- Get XDG_CONFIG_HOME, or default to $HOME/.config
CONFIG_PATH = os.getenv("XDG_CONFIG_HOME") and os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config"

-- The maximum line length
LINE_WIDTH = 100

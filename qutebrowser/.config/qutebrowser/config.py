# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Name of the session to load by default
c.session.default_name = "default"

# Automatically save the current session
c.auto_save.session = True

# Disable <video> autoplay
c.content.autoplay = False
config.set("content.autoplay", True, "play.google.com/music/*")

# Prevent websites from asking for geolocation
c.content.geolocation = False

# Disable host blocking; this is redundant as I handle host blocking at the
# gateway level for all devices on my LAN and locally, using /etc/hosts, for
# non-static devices (e.g. laptops)
c.content.host_blocking.enabled = False

# Enable JavaScript
c.content.javascript.enabled = True
config.set("content.javascript.enabled", True, "file://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

# Set default content.notifications behavior for specific URLs
c.content.notifications = False
config.set("content.notifications", True, "calendar.google.com")
config.set("content.notifications", True, "play.google.com")
config.set("content.notifications", True, "music.youtube.com")
config.set("content.notifications", True, "messages.google.com")
config.set("content.notifications", True, "www.fastmail.com")

# Set default content.register_protocol_handler behavior for specific URLs
c.content.register_protocol_handler = False
config.set("content.register_protocol_handler", True, "calendar.google.com")
config.set("content.register_protocol_handler", True, "www.fastmail.com")

# Which interfaces to expose via WebRTC
c.content.webrtc_ip_handling_policy = "default-public-interface-only"

# Directory to save downloads
c.downloads.location.directory = "~/downloads"

# Open new tabs in the background
c.tabs.background = True

# Open new tabs at the end of the stack
c.tabs.new_position.related = "last"

# Page to open if :open -t/-b/-w is used without URL.
c.url.default_page = "about:blank"

# Set colors for private browsing mode
# Note that "private browsing mode" above refers the Qutebrowser's internal
# "private mode", and as such these settings only apply to windows opened in
# private mode (`open -p`) within a session using this configuration file.
c.colors.statusbar.command.private.bg = "#7A378B"
c.colors.statusbar.command.private.fg = "#FDF8FF"
c.colors.statusbar.private.bg = "#68228B"
c.colors.statusbar.private.fg = "#FDF8FF"

# This ensures that any changes to the default value for `url.searchengines` are
# not propagated without updating the value below, explicitly.
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "!a": "https://www.amazon.com/s?k={}",
    "!ao": "https://www.amazon.com/gp/your-account/order-history/ref=ppx_yo_dt_b_search?search={}",
    "!ap": "https://www.archlinux.org/packages/?q={}",
    "!aur": "https://aur.archlinux.org/packages/?K={}",
    "!aw": "https://wiki.archlinux.org/index.php?search={}",
    "!cb": "https://www.crunchbase.com/textsearch?q={}",
    "!crates": "https://crates.io/search?q={}",
    "!domain": "https://domains.google.com/registrar/search?searchTerm={}",
    "!evo": "https://www.evo.com/shop?text={}",
    "!gh": "https://github.com/search?q={}",
    "!gm": "https://play.google.com/store/search?c=movies&q={}",
    "!li": "https://www.linkedin.com/search/results/all/?keywords={}",
    "!lic": "https://www.linkedin.com/search/results/people/?facetNetwork=%5B%22F%22%5D&keywords={}",
    "!lim": "https://www.linkedin.com/messaging/?searchTerm={}",
    "!lip": "https://www.linkedin.com/search/results/people/?keywords={}",
    "!lij": "https://www.linkedin.com/jobs/search/?keywords={}",
    "!music": "https://music.youtube.com/search?q={}",
    "!r": "https://www.reddit.com/search?q={}",
    "!rsw": "https://runescape.wiki/w/Special:Search?search={}",
    "!rust": "https://doc.rust-lang.org/std/?search={}",
    "!rustn": "https://doc.rust-lang.org/nightly/std/?search={}",
    "!tf": "https://registry.terraform.io/search/?q={}",
    "!tfm": "https://registry.terraform.io/search/modules?q={}",
    "!tfp": "https://registry.terraform.io/search/providers?q={}",
    "!w": "https://en.wikipedia.org/w/index.php?search={}",
    "!yt": "https://www.youtube.com/results?search_query={}",
    "!yth": "https://www.youtube.com/feed/history?query={}",
    "!ytm": "https://music.youtube.com/search?q={}",
}

# Hide window decoration (e.g. Gnome title bar)
c.window.hide_decoration = True

# Format the window title
c.window.title_format = "{perc}{current_title}"

################################################################################
# Aliases
################################################################################
c.aliases = {
    "read": "spawn --userscript readability-js",
}

################################################################################
# Keybinds
#
# The default method for binding keys to different modes is fairly cumbersome
# when binding lots of keys to different modes. The `keybinds` dict below is
# has a single top-level key for each supported mode, whose value is another
# dict of key:command mappings.
################################################################################
keybinds = {
    "normal": {
        "<alt+0>": "tab-focus 10",
        "<alt+9>": "tab-focus 9",
        "<ctrl+j>": "enter-mode passthrough",
        "<ctrl+pgdown>": None,
        "<ctrl+pgup>": None,
        "<ctrl+shift+w>": None,
        "<ctrl+v>": None,
        "<ctrl+w>": None,
        "g$": None,
        "gJ": "tab-focus -1",
        "gK": "tab-focus 1",
        "g^": None,
        "gh": "tab-move -",
        "gl": "tab-move +",
        "gr": None,
    },
    "caret": {"<ctrl+j>": "leave-mode", "<escape>": None},
    "command": {"<ctrl+j>": "leave-mode", "<escape>": None},
    "hint": {"<ctrl+j>": "leave-mode", "<escape>": None},
    "insert": {"<ctrl+j>": "leave-mode", "<escape>": None},
    "passthrough": {"<ctrl+j>": "leave-mode", "<shift+escape>": None},
    "prompt": {"<ctrl+j>": "leave-mode", "<escape>": None},
    "register": {"<ctrl+j>": "leave-mode", "<escape>": None},
    "yesno": {"<ctrl+j>": "leave-mode", "<escape>": None},
}


for mode, binds in keybinds.items():
    for k, v in binds.items():
        if v is None:
            config.unbind(k, mode=f"{mode}")
        else:
            config.bind(k, v, mode=f"{mode}")

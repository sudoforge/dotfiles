# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Don't load autoconfig.yml (this is required as of v2.0.0)
config.load_autoconfig(False)

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
c.content.blocking.enabled = False

# Enable JavaScript
c.content.javascript.enabled = True
config.set("content.javascript.enabled", True, "file://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

# Set default content.notifications behavior for specific URLs
c.content.notifications.enabled = False
config.set("content.notifications.enabled", True, "https://calendar.google.com/*")
config.set("content.notifications.enabled", True, "https://drive.google.com/*")
config.set("content.notifications.enabled", True, "https://music.youtube.com/*")
config.set("content.notifications.enabled", True, "https://messages.google.com/*")
config.set("content.notifications.enabled", True, "https://www.fastmail.com/*")

# Allow URLs to capture the desktop
c.content.desktop_capture = False
config.set("content.desktop_capture", True, "https://meet.google.com/*")

# Allow URLs to capture audio and video
c.content.media.audio_capture = False
c.content.media.video_capture = False
c.content.media.audio_video_capture = False
config.set("content.media.audio_capture", True, "https://meet.google.com/*")
config.set("content.media.video_capture", True, "https://meet.google.com/*")

# Set default content.register_protocol_handler behavior for specific URLs
c.content.register_protocol_handler = False
config.set("content.register_protocol_handler", True, "https://calendar.google.com/*")
config.set("content.register_protocol_handler", True, "https://www.fastmail.com/*")

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
    "!mdn": "https://developer.mozilla.org/en-US/search?q={}",
    "!music": "https://music.youtube.com/search?q={}",
    "!od": "https://www.opendota.com/search?q={}",
    "!r": "https://www.reddit.com/search?q={}",
    "!rsw": "https://runescape.wiki/w/Special:Search?search={}",
    "!rust": "https://doc.rust-lang.org/std/?search={}",
    "!rustn": "https://doc.rust-lang.org/nightly/std/?search={}",
    "!tf": "https://registry.terraform.io/search/?q={}",
    "!tfm": "https://registry.terraform.io/search/modules?q={}",
    "!tfp": "https://registry.terraform.io/search/providers?q={}",
    "!w": "https://en.wikipedia.org/w/index.php?search={}",
    "!wh": "https://www.wowhead.com/search?q={}",
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
        "<ctrl+j>": "mode-enter passthrough",
        "<ctrl+pgdown>": None,
        "<ctrl+pgup>": None,
        "<ctrl+shift+n>": None,
        "<ctrl+shift+o>": "set-cmd-text -s :open -p",
        "<ctrl+shift+w>": None,
        "<ctrl+v>": None,
        "<ctrl+w>": None,
        "g$": None,
        "g^": None,
        "<ctrl+t>": "tab-focus last",
        "po": "open -p -- {clipboard}",
        "pt": "open -t -- {clipboard}",
    },
    "caret": {
        "<ctrl+j>": "mode-leave",
        "<escape>": None,
    },
    "command": {
        "<Tab>": None,
        "<ctrl+j>": "mode-leave",
        "<ctrl+n>": "completion-item-focus next",
        "<ctrl+p>": "completion-item-focus prev",
        "<ctrl+shift+n>": "completion-item-focus --history next",
        "<ctrl+shift+p>": "completion-item-focus --history prev",
        "<escape>": None,
    },
    "hint": {
        "<ctrl+j>": "mode-leave",
        "<escape>": None,
    },
    "insert": {
        "<ctrl+j>": "mode-leave",
        "<escape>": None,
    },
    "passthrough": {
        "<ctrl+j>": "mode-leave",
        "<shift+escape>": None,
    },
    "prompt": {
        "<ctrl+j>": "mode-leave",
        "<escape>": None,
    },
    "register": {
        "<ctrl+j>": "mode-leave",
        "<escape>": None,
    },
    "yesno": {
        "<ctrl+j>": "mode-leave",
        "<escape>": None,
    },
}

for mode, binds in keybinds.items():
    for k, v in binds.items():
        if v is None:
            config.unbind(k, mode=f"{mode}")
        else:
            config.bind(k, v, mode=f"{mode}")

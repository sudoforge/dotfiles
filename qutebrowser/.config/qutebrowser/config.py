# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

import os
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config
c: ConfigContainer = c

# Don't load autoconfig.yml (this is required as of v2.0.0)
config.load_autoconfig(False)

# Name of the session to load by default
c.session.default_name = "default"

# Automatically save the current session
c.auto_save.session = True

# Disable <video> autoplay
c.content.autoplay = False

# Disable asking for location permissions
c.content.geolocation = False

# Disable host blocking; this is redundant as I handle host blocking at the
# gateway level for all devices on my LAN and locally, using /etc/hosts, for
# non-static devices (e.g. laptops)
c.content.blocking.enabled = False

# Disable third-party cookies by default (why is this not the default behavior?)
c.content.cookies.accept = "no-3rdparty"

# Domain-specific cookie acceptance configuration
HOST_SPECIFIC_COOKIES = {
    "https://teams.microsoft.com": "all",
}

for host, value in HOST_SPECIFIC_COOKIES.items():
    config.set("content.cookies.accept", value, f"{host}/*")

# Enable Javascript... because that's how the web works these days
c.content.javascript.enabled = True

# Disable desktop notifications by default
c.content.notifications.enabled = False

# Disable desktop capture by default
c.content.desktop_capture = False

# Disable audio video capture by default
c.content.media.audio_capture = False
c.content.media.video_capture = False
c.content.media.audio_video_capture = False

# Disable protocol handler registration by default
c.content.register_protocol_handler = False

# Define variables for permissions
AUTOPLAY = "content.autoplay"
CAPTURE_AUDIO = "content.media.audio_capture"
CAPTURE_AV = "content.media.audio_video_capture"
CAPTURE_DESKTOP = "content.desktop_capture"
CAPTURE_VIDEO = "content.media.video_capture"
HANDLER = "content.register_protocol_handler"
NOTIFICATIONS = "content.notifications.enabled"

# A mapping of host patterns to the permissions granted to matching URIs. For
# information about the matching patterns, see [0].
#
# [0]: https://developer.chrome.com/docs/extensions/mv3/match_patterns/
HOST_ENABLED_PERMISSIONS = {
    "https://*.slack.com": [AUTOPLAY, CAPTURE_AUDIO, CAPTURE_DESKTOP, NOTIFICATIONS],
    "https://*.zoom.us": [CAPTURE_AUDIO, CAPTURE_VIDEO],
    "https://app.chime.aws": [CAPTURE_AUDIO, CAPTURE_DESKTOP],
    "https://app.element.io": [
        CAPTURE_AV,
        CAPTURE_AUDIO,
        CAPTURE_DESKTOP,
        NOTIFICATIONS,
    ],
    "https://calendar.google.com": [HANDLER, NOTIFICATIONS],
    "https://discord.com": [CAPTURE_AUDIO, CAPTURE_DESKTOP, NOTIFICATIONS],
    "https://drive.google.com": [NOTIFICATIONS],
    "https://app.gather.town": [CAPTURE_AUDIO],
    "https://meet.google.com": [CAPTURE_AUDIO, CAPTURE_DESKTOP, CAPTURE_VIDEO],
    "https://messages.google.com": [NOTIFICATIONS],
    "https://music.youtube.com": [AUTOPLAY, NOTIFICATIONS],
    "https://teams.microsoft.com": [CAPTURE_AUDIO, CAPTURE_DESKTOP],
    "https://tweetdeck.twitter.com": [NOTIFICATIONS],
    "https://www.fastmail.com": [NOTIFICATIONS, HANDLER],
}

# Enable permissions for hosts
for host, perms in HOST_ENABLED_PERMISSIONS.items():
    for p in perms:
        config.set(p, True, f"{host}/*")

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

# Disable mouse back/forward buttons
c.input.mouse.back_forward_buttons = False

# Disable closing tabs with mouse buttons
c.tabs.close_mouse_button = "none"

# Disable mousewheel tab switching
c.tabs.mousewheel_switching = False

# Disable ctrl+mousewheel zooming
c.zoom.mouse_divider = 0

# Configure the filepicker
filepicker = [
    "alacritty",
    "--class",
    "filepicker",
    "--title",
    "filepicker",
    "-e",
    "lf",
    "-command",
    "set nohidden",
    "-selection-path={}",
]
c.fileselect.handler = "external"
c.fileselect.folder.command = filepicker
c.fileselect.multiple_files.command = filepicker
c.fileselect.single_file.command = filepicker

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
    "!eth": "https://etherscan.io/search?q={}",
    "!evo": "https://www.evo.com/shop?text={}",
    "!fedex": "https://www.fedex.com/fedextrack/?trknbr={}",
    "!gd": "https://domains.google.com/registrar/search?tab=1&searchTerm={}",
    "!gh": "https://github.com/search?q={}",
    "!ghu": "https://github.com/{}",
    "!gm": "https://play.google.com/store/search?c=movies&q={}",
    "!go": "https://pkg.go.dev/search?q={}",
    "!hub": "https://hub.docker.com/search/?type=image&q={}",
    "!li": "https://www.linkedin.com/search/results/all/?keywords={}",
    "!lic": "https://www.linkedin.com/search/results/people/?facetNetwork=%5B%22F%22%5D&keywords={}",
    "!lim": "https://www.linkedin.com/messaging/?searchTerm={}",
    "!lip": "https://www.linkedin.com/search/results/people/?keywords={}",
    "!lij": "https://www.linkedin.com/jobs/search/?keywords={}",
    "!maps": "https://www.google.com/maps/search/{}",
    "!mdn": "https://developer.mozilla.org/en-US/search?q={}",
    "!music": "https://music.youtube.com/search?q={}",
    "!poly": "https://polygonscan.com/search?q={}",
    "!r": "https://www.reddit.com/search?q={}",
    "!rust": "https://doc.rust-lang.org/std/?search={}",
    "!rustn": "https://doc.rust-lang.org/nightly/std/?search={}",
    "!tf": "https://registry.terraform.io/search/?q={}",
    "!tfm": "https://registry.terraform.io/search/modules?q={}",
    "!tfp": "https://registry.terraform.io/search/providers?q={}",
    "!ups": "https://wwwapps.ups.com/WebTracking/processInputRequest?tracknum={}",
    "!w": "https://en.wikipedia.org/w/index.php?search={}",
    "!xlm": "https://stellar.expert/explorer/public/search?term={}",
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

# Keybinds
# A map of maps, mapping keys to commands in different modes
c.bindings.commands = {
    "normal": {
        "<alt+0>": "tab-focus 10",
        "<alt+9>": "tab-focus 9",
        "<ctrl+j>": "mode-enter passthrough",
        "<ctrl+pgdown>": None,
        "<ctrl+pgup>": None,
        "<ctrl+shift+n>": None,
        "<ctrl+shift+o>": "set-cmd-text -s :open -p",
        "<ctrl+shift+w>": None,
        "<ctrl+t>": "tab-focus last",
        "<ctrl+v>": None,
        "<ctrl+w>": None,
        "M": None,
        "Ma": "bookmark-add",
        "Md": "bookmark-del {url}",
        "g$": None,
        "g^": None,
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

# Load a user-local configuration file, if it exists
config_local = f"{os.path.abspath(os.path.dirname(__file__))}/config.local.py"

if os.path.exists(config_local):
    config.source(config_local)

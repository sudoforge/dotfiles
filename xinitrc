sxhkd &
xrandr \
    --output eDP-1 --primary --mode 1920x1080 --pos 1616x1440 --rotate normal \
    --output DVI-I-1-1 --mode 2560x1440 --pos 2560x0 --rotate normal \
    --output DVI-I-2-2 --mode 2560x1440 --pos 0x0 --rotate normal \
    --output HDMI-1 --off \
    --output DP-1 --off
exec bspwm

sxhkd &
xrandr --output eDP-1 --primary --mode 1920x1080 --below DP-1
xrandr --output DP-1 --noprimary --mode 2560x1440 --above eDP-1
exec bspwm

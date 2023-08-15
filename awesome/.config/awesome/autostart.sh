autorandr --load default &
picom &
xsetroot -cursor_name left_ptr &
[ -z  "$(pgrep nm-applet)" ] && nm-applet &
[ -z  "$(pgrep blueman-applet)" ] && blueman-applet &

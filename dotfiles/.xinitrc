# .xinitrc

xset b off
setxkbmap -option ctrl:nocaps
xmodmap -e "clear Mod1"
xmodmap -e "keycode 64 = Escape"
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Natural Scrolling Enabled" 1

ulimit -Sc 0
export GTK_THEME=Adwaita:dark

if command -v hsetroot >/dev/null 2>&1; then
    hsetroot -fill "$HOME/.img.jpg"
fi

if command -v xcompmgr >/dev/null 2>&1; then
    xcompmgr &
fi

if command -v unclutter >/dev/null 2>&1; then
    unclutter -idle 3 -root &
fi

exec cwm

#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

# Statusbar loop
#while true; do
#   xsetroot -name "$( date +"%F %R" )"
#   sleep 1m    # Update time every minute
#done &

# Autostart section
pcmanfm & 

#japanese input
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim&
export XMODIFIERS='@im=uim'
uim-toolbar-gtk3-systray &

[ ! -s ~/.config/mpd/pid ] && mpd #start mpd
mpdscribble & #scrobler
sh ~/.fehbg & #wallpaper
feh --bg-scale ~/google\ drive/pictures/wallpapers/_wallpaper_1.png &

xset m 1 0 &
#(sleep 15s && xset m 1 0) &
slstatus -d &
exec dwm
#exec mate-session

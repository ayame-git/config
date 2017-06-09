eval `ssh-agent -s`
[ ! -s ~/.cofnig/mpd/pid ] && mpd
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

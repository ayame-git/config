HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '$HOME/.zshrc'

#colorscheme & stuff
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#prompt
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}>"

#spell checking
setopt correctall 
autoload -Uz compinit
compinit

#PATH
export GOPATH=$HOME/go
export PATH=$PATH:~/bin:$GOROOT/bin:$GOPATH/bin

#variables
export CONFIG_DIR=$HOME/.config
export DOWNLOADS_DIR=$HOME/downloads
export DRIVE_DIR=$HOME/google-drive
export MUSIC_DIR=$HOME/music

export ANIME_DIR=$HOME/anime
export MANGA_DIR=$HOME/manga

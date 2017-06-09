# Created by newuser for 5.1.1
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

#colors & stuff
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}>"

setopt correct #spell checking

autoload -Uz compinit
compinit

#PATH
export GOPATH=$HOME/go
export PATH=$PATH:~/bin:$GOROOT/bin:$GOPATH/bin

#variables

#functions
mkcd() {
  mkdir "$1" && cd "$1"
}

#alias
alias cls='printf "\033c"'


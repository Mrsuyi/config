#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias c='clear'
alias e='exit'
alias f='fg'
alias t='tree'
alias l='ls -hl --time-style=iso'
alias ll='ls -ahl --time-style=iso'
alias rm='/bin/rm'
alias vi='vim'
alias gs='git status'
alias gpo='git push origin'
alias gst='git stash'
alias cc="gcc -std=c11"
alias cxx="g++ -std=c++11"

if [ "x$TERM" = "xxterm" ]
then
    export TERM="xterm-256color"
fi

# powerline
. /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh

#PS1='[\u@\h \W]\$ '

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ..='cd ..'
alias l='ls -hl'
alias ll='ls -ahl'

if [ "x$TERM" = "xxterm" ]
then
    export TERM="xterm-256color"
fi

# powerline
. /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh

#PS1='[\u@\h \W]\$ '

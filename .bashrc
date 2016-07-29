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

#PS1='[\u@\h \W]\$ '

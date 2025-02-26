#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias c='clear'
alias e='exit'
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

# For homebrew.
export PATH="/opt/homebrew/bin:$PATH"
export LD_LIBRARY_PATH="opt/homebrew/lib:$LD_LIBRARY_PATH"

# Disable git status because it's too slow in Chromium dir.
git config --global --unset-all oh-my-zsh.hide-dirty
git config --global --add oh-my-zsh.hide-dirty 1

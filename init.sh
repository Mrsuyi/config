#!/usr/bin/env bash

# vim
rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -f ~/.vimrc
ln -s ~/config/.vimrc ~
rm -f ~/.ycm_extra_conf.py
ln -s ~/config/.ycm_extra_conf.py ~
ln -s ~/config/vim/skeleton ~/.vim

# zsh
sh -c $(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)
rm -f ~/.zshrc
ln -s ~/config/.zshrc ~

# top
rm -f ~/.toprc
ln -s ~/config/.toprc ~

# xinit
rm -f ~/.xinitrc
ln -s ~/config/.xinitrc ~

# tmux
rm -f ~/.tmux.conf
ln -s ~/config/.tmux.conf ~
rm -f ~/.tmux.theme
ln -s ~/config/.tmux.theme ~

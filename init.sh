#!/usr/bin/env bash

# vim
rm -rf ~/.vim && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm ~/.vimrc && ln -s ~/config/.vimrc ~
rm ~/.ycm_extra_conf.py && ln -s ~/config/.ycm_extra_conf.py ~
ln -s ~/config/vim/skeleton ~/.vim

# zsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
rm ~/.zshrc && ln -s ~/config/.zshrc ~

# top
rm ~/.toprc && ln -s ~/config/.toprc ~

# xinit
rm ~/.xinitrc && ln -s ~/config/.xinitrc ~

# tmux
rm ~/.tmux.conf && ln -s ~/config/.tmux.conf ~
rm ~/.tmux.theme && ln -s ~/config/.tmux.theme ~

# lxterminal
rm -rf ~/.config/lxterminal && ln -s ~/config/lxterminal ~/.config

# awesome
rm -rf ~/.config/awesome && ln -s ~/config/awesome ~/.config

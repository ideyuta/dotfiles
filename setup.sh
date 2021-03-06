#!/usr/bin/env bash

BASE_DIR=$(pwd)

# Git
ln -si $BASE_DIR/gitconfig $HOME/.gitconfig

# Tig
ln -si $BASE_DIR/tigrc $HOME/.tigrc

# TMUX
ln -si $BASE_DIR/tmux.conf $HOME/.tmux.conf

# Vim
ln -si $BASE_DIR/vimrc $HOME/.vimrc
ln -si $BASE_DIR/vimrc $HOME/.config/nvim/init.vim
ln -si $BASE_DIR/vim $HOME/.vim
ln -si $BASE_DIR/gvimrc $HOME/.gvimrc
ln -si $BASE_DIR/deoplete.rc.vim $HOME/deoplete.rc.vim
ln -si $BASE_DIR/neomake.rc.vim $HOME/neomake.rc.vim

# Zsh
ln -si $BASE_DIR/zshrc $HOME/.zshrc

# ESLint
ln -si $BASE_DIR/eslintrc $HOME/.eslintrc


ln -si $BASE_DIR/dein.toml $HOME/.dein.toml
ln -si $BASE_DIR/dein_lazy.toml $HOME/.dein_lazy.toml

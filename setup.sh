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
ln -si $BASE_DIR/vim $HOME/.vim
ln -si $BASE_DIR/gvimrc $HOME/.gvimrc

# Zsh
ln -s $BASE_DIR/zshrc $HOME/.zshrc

# ESLint
ln -s $BASE_DIR/eslintrc $HOME/.eslintrc

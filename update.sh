#!/bin/bash
mkdir -p .ssh
cp ~/.ssh/config ./.ssh/config

cp ~/.zshrc ./.zshrc
cp ~/.tmux.conf ./.tmux.conf
cp ~/.vimrc ./.vimrc

mkdir -p .config/karabiner/assets/complex_modifications/
cp ~/.config/karabiner/assets/complex_modifications/grankeys.json .config/karabiner/assets/complex_modifications/grankeys.json

#!/bin/sh

mkdir -p ./kitty
cp ~/.zshrc ./zshrc
cp ~/.config/kitty/* ./kitty
cp ~/.tmux.conf ./tmux.conf
cp ~/.vimrc ./vimrc
cp ~/.gitconfig ./gitconfig
cp ~/.config/starship.toml ./starship.toml
cp /usr/local/bin/fubectl.source ./fubectl.source

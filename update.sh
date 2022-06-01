#!/bin/sh

cp ~/.zshrc ./zshrc
cp ~/.tmux.conf ./tmux.conf
cp ~/.vimrc ./vimrc
cp ~/.gitconfig ./gitconfig
mkdir -p ./iterm
cp ~/.iterm/* ./iterm/
cp ~/.config/starship.toml ./starship.toml
cp /usr/local/bin/fubectl.source ./fubectl.source

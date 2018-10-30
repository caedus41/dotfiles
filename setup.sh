#!/bin/sh

cp ./zshrc ~/.zshrc
cp ./tmux.conf ~/.tmux.conf
cp ./vimrc ~/.vimrc
cp ./gitconfig ~/.gitconfig
cp ./iterm/* ~/.iterm/
echo "Make sure to configure iterm to load configs from the ~/.iterm directory"

brew update && brew install awscli \
    awless                         \
    fzf                            \
    go                             \
    hub                            \
    jq                             \
    kops                           \
    kubernetes-cli                 \
    kubernetes-helm                \
    iterm2                         \
    stern                          \
    telnet                         \
    tmux                           \
    yq                             \
    zsh                            \

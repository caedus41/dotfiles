#!/bin/sh

### PSST, This script doesn't work the way you think
### What I mean is...
### It doesn't work
### But, at least it's a list of what you want

mkdir -p ~/.config
cp ./zshrc ~/.zshrc
cp ./tmux.conf ~/.tmux.conf
cp ./vimrc ~/.vimrc
cp ./gitconfig ~/.gitconfig
cp ./iterm/* ~/.iterm/
cp ./starship.toml ~/.config/starship.toml
cp ./fzf.bash ~/.fzf.bash
echo "Make sure to configure iterm to load configs from the ~/.iterm directory"

#if [[ -z $(which brew) ]]; then
    #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#fi
#
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#brew update && brew install awscli \
    #fzf                            \
    #go                             \
    #hub                            \
    #jq                             \
    #kops                           \
    #kubernetes-cli                 \
    #kubernetes-helm                \
    #iterm2                         \
    #stern                          \
    #telnet                         \
    #tmux                           \
    #tmux                           \
    #tree                           \
    #yq                             \
#
#brew tap wallix/awless; brew install awless

#!/bin/bash

####
#
# Checks if oh my zsh is not installed and installs
#
####

if [ ! -d "$HOME/.oh-my-zsh" ]; then
   echo "Dir does not exist"
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
   echo "file does not exist"
   rm -rf ~/.oh-my-zsh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


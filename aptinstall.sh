#!/bin/bash

sudo apt-add-repository universe
sudo apt update

function install {
  echo "Installing: ${1}..."
  sudo apt install -y $1
}

install git
install neovim
install python3-pip
install tmux
install vim
install zsh

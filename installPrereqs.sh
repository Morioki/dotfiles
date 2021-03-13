#!/bin/bash
export DEBIAN_FRONTEND=noninteractive 
export CHSH=yes

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install zsh curl git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

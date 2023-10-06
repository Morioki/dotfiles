#!/bin/bash
export DEBIAN_FRONTEND=noninteractive 
export CHSH=yes

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install zsh curl git

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
# sudo chmod +x /usr/local/bin/oh-my-posh
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
 
mkdir ~/.z
cd ~/.z
sudo wget https://raw.githubusercontent.com/rupa/z/master/z.sh

#!/bin/bash
# Make directories if not exists
echo "Deploying Dotfiles"
mkdir -p -- "/usr/local/bin"
# 
# Rename files if exist
cp ~/.zshrc ~/.zshrc.predotfile 2>/dev/null
# cp "$ZSH/custom/themes/mori.zsh-theme" "$ZSH/custom/themes/mori.zsh-theme.predotfile" 2>/dev/null
cp /usr/local/bin/qwe.sh /usr/local/bin/qwe.sh.predotfile 2>/dev/null

# Link Dotfiles
cp ./system/.zshrc ~/.zshrc
cp -u ./system/.alias ~/.alias
cp -u ./system/.custom ~/.custom
cp -u ./theme/dir_colors ~/.dir_colors
# cp ./theme/mori.zsh-theme "$ZSH/custom/themes/mori.zsh-theme"
cp ./theme/.morioki.omp.json ~/.morioki.omp.json
sudo ln -fn ./bin/qwe.sh /usr/local/bin/qwe.sh

chsh -s /bin/zsh

echo 'Please run compinstall and then Restart your shell to use new dotfiles'
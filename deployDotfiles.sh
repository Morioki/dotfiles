#!/bin/bash
# Make directories if not exists
echo "Deploying Dotfiles"
mkdir -p -- "/usr/local/bin"
mkdir -p -- "$ZSH"
mkdir -p -- "$ZSH/custom"
mkdir -p -- "$ZSH/custom/themes"

# Rename files if exist
cp ~/.zshrc ~/.zshrc.predotfile 2>/dev/null
cp "$ZSH/custom/themes/mori.zsh-theme" "$ZSH/custom/themes/mori.zsh-theme.predotfile" 2>/dev/null
cp /usr/local/bin/qwe.sh /usr/local/bin/qwe.sh.predotfile 2>/dev/null

# Link Dotfiles
cp ./system/.zshrc ~/.zshrc
cp ./system/.alias ~/.alias
cp ./theme/mori.zsh-theme "$ZSH/custom/themes/mori.zsh-theme"
sudo ln -sfn ./bin/qwe.sh /usr/local/bin/qwe.sh

echo 'Restart your shell to use new dotfiles'
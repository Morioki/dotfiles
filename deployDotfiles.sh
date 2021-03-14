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
ln -fn ./system/.zshrc ~/.zshrc
ln -fn ./system/.alias ~/.alias
ln -fn ./theme/mori.zsh-theme "$ZSH/custom/themes/mori.zsh-theme"
sudo ln -fn ./bin/qwe.sh /usr/local/bin/qwe.sh

echo 'Restart your shell to use new dotfiles'
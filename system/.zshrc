# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# # The following lines were added by compinstall
# zstyle :compinstall filename '/home/grbraatz/.zshrc'

# autoload -Uz compinit
# compinit
# # End of lines added by compinstall


eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config ~/.morioki.omp.json)"

source ~/.alias
source ~/.custom

test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

export _Z_DATA=~/.zdat
. ~/.z/z.sh
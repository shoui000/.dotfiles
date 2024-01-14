#!/usr/bin/env bash
# have to chmod +x ./install.sh to work

# install tmux, tpm
sudo snap install nvim --classic -y
sudo apt install fzf -y

ln -s ~/projetos/.dotfiles/nvim ~/.config # Creates symlink of nvim configs
ln -s ~/projetos/.dotfiles/.dotfiles/.bash_aliases ~/.bash_aliases # Creates symlink of bash_aliases

#  have to create a method of auto chmod every command in the bash commands folder
chmod +x ~/projetos/.dotfiles/bash_scripts/

#!/usr/bin/env bash
# have to chmod +x ./install.sh to work

# install tmux, tpm
sudo snap install nvim --classic -y
ln -s ~/projetos/.dotfiles/nvim ~/.config # Creates symlink of nvim configs

ln -s ~/projetos/.dotfiles/.dotfiles/.bash_aliases ~/.bash_aliases # Creates symlink of bash_aliases

#  have to create a method of auto chmod every command in the bash commands folder

sudo apt install fzf -y
echo 'export PATH="~/projetos/.dotfiles/bash_commands:$PATH"' >> ~/.bashrc # Add bash commands folder to the path
echo 'export ADVENT="~/projetos/advent-of-code:$ADVENT"' >> ~/.bashrc # Exports advent of code folder as $ADVENT
chmod +x -r ~/projetos/.dotfiles/bash_commands

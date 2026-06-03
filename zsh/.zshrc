# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="nicoulaj"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

plugins=(git tmux zsh-autosuggestions emoji)

source $ZSH/oh-my-zsh.sh

source ~/.zsh_profile
source ~/.zsh_keybindings

unsetopt LIST_BEEP
path+=("/home/ddeveza/.local/share/mise/shims")
path+=("/home/ddeveza/.local/bin/")
export PATH

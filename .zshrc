# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/sbin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kaoss"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git rake rails zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source $HOME/zshrc/user to .zshrc
source $HOME/zshrc/aliases to .zshrc
source $HOME/zshrc/dockeraliases to .zshrc
source $HOME/zshrc/fzf to .zshrc
source $HOME/zshrc/nvm to .zshrc
source $HOME/zshrc/rails to .zshrc
source $HOME/zshrc/betty to .zshrc
source $HOME/zshrc/rbenv to .zshrc
source $HOME/zshrc/color to .zshrc
# source $HOME/zshrc/rvm to .zshrc

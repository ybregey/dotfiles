# fix ^M on return key press
stty icrnl

export MAILCHECK=0
export ZSH_HIGHLIGHT_MAXLENGTH=30
export EDITOR="atom"
export GEM_EDITOR="atom"

export PATH=$HOME/bin:/usr/bin:/usr/local/bin:$PATH

ZSH_THEME="kaoss"
BAT_THEME="TwoDark"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git rails zsh-autosuggestions docker-compose)

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd)
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Oh my zsh!
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

source $HOME/zshrc/user to .zshrc
source $HOME/zshrc/aliases to .zshrc
source $HOME/zshrc/fzf to .zshrc
#source $HOME/zshrc/nvm to .zshrc
#source $HOME/zshrc/go to .zshrc
source $HOME/zshrc/rails to .zshrc
source $HOME/zshrc/betty to .zshrc
source $HOME/zshrc/rbenv to .zshrc
source $HOME/zshrc/docker to .zshrc
source <(cat $HOME/zshrc/projects/*)
source $HOME/zshrc/color to .zshrc

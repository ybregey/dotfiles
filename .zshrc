# fix ^M on return key press
#stty icrnl
stty sane

export PATH=$HOME/bin:/usr/bin:/usr/local/bin:$PATH
export MAILCHECK=0
export ZSH_HIGHLIGHT_MAXLENGTH=30
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_THEME="kaoss"
export BAT_THEME="TwoDark"

CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
fzf-zsh
git
rails
zsh-autosuggestions
zsh-syntax-highlighting
docker-compose
)

# Oh my zsh!
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

source $HOME/zshrc/user to .zshrc
source $HOME/zshrc/aliases to .zshrc
source $HOME/zshrc/fzf to .zshrc
source $HOME/zshrc/elixir to .zshrc
source $HOME/zshrc/rails to .zshrc
source $HOME/zshrc/betty to .zshrc
#source $HOME/zshrc/rbenv to .zshrc
source $HOME/zshrc/asdf to .zshrc
source $HOME/zshrc/docker to .zshrc
source <(cat $HOME/zshrc/projects/*)

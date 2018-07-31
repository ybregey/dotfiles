export PATH=$HOME/bin:/usr/bin:/usr/local/bin:$PATH

ZSH_THEME="kaoss"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git rake rails zsh-autosuggestions)

# Oh my zsh!
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

source $HOME/zshrc/user to .zshrc
source $HOME/zshrc/aliases to .zshrc
source $HOME/zshrc/dockeraliases to .zshrc
source $HOME/zshrc/fzf to .zshrc
source $HOME/zshrc/nvm to .zshrc
source $HOME/zshrc/go to .zshrc
source $HOME/zshrc/rails to .zshrc
source $HOME/zshrc/betty to .zshrc
source $HOME/zshrc/linuxbrew to .zshrc
source $HOME/zshrc/rbenv to .zshrc
# source $HOME/zshrc/color to .zshrc

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/kaoss/.nvm/versions/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/kaoss/.nvm/versions/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/kaoss/.nvm/versions/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/kaoss/.nvm/versions/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

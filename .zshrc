unsetopt BG_NICE

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export NVM_DIR="$HOME/.nvm"

source $HOME/antigen.zsh
[-s "$HOME/.zshalias" ] && source "$HOME/.zshalias"

antigen use oh-my-zsh

antigen bundle git
antigen bundle docker
antigen bundle docker-compose
antigen bundle command-not-found
antigen bundle mvn
antigen bundle systemd
antigen bundle history
antigen bundle ssh-agent
antigen bundle djui/alias-tips
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme kcrawley/zsh-custom themes/xxf

antigen apply

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
unsetopt BG_NICE

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle docker
antigen bundle docker-compose
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme kcrawley/zsh-custom themes/xxf

antigen apply

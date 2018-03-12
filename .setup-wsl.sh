#!/bin/bash

CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
  printf "Error: zsh is not installed\n"
  exit
fi
unset CHECK_ZSH_INSTALLED

hash git >/dev/null 2>&1 || {
  echo "Error: git is not installed"
  exit 1
}

hash curl >/dev/null 2>&1 || {
  echo "Error: curl is not installed"
  exit 1
}

# remove any lingering doubt
rm -rf ~/.oh-my-zsh
rm -rf ~/antigen.zsh
rm -rf ~/.antigen

if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc_preinstall
fi

env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh || {
  printf "Error: git clone of oh-my-zsh repo failed\n"
  exit 1
}

curl -L git.io/antigen > antigen.zsh

if [[ -f ~/.git ]]; then
  rm -rf .git
fi

git init
git remote add origin git@github.com:kcrawley/tilde-slash.git
git fetch
git reset --hard origin/master

if [[ -f ~/.bashrc ]]; then
  mv ~/.bashrc ~/.bashrc_preinstall
fi

tee $HOME/.bashrc <<EOF
export DOCKER_HOST='tcp://0.0.0.0:2375'

bash -c zsh
EOF


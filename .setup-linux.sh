#!/bin/bash

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

if [[ -d ~/.git ]]; then
  cd ~ && rm -rf .git
fi

git init
git remote add origin https://github.com/kcrawley/tilde-slash.git
git fetch
git reset --hard origin/master

git remote set-url origin git@github.com:kcrawley/tilde-slash.git

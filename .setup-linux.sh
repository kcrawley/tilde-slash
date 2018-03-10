#!/bin/bash

curl -L git.io/antigen > antigen.zsh

cd $HOME && rm -rf .git

git init
git remote add origin https://github.com/kcrawley/tilde-slash.git
git fetch
git reset --hard origin/master

git remote set-url origin git@github.com:kcrawley/tilde-slash.git

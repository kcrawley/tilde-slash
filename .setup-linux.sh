#!/bin/bash

curl -L git.io/antigen > antigen.zsh

git init
git remote add origin git@github.com:kcrawley/tilde-slash.git
git fetch
git reset --hard origin/master



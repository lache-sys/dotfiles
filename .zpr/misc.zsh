#!/usr/bin/env zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
# eval "$(/usr/local/bin/brew shellenv)"
export PATH="$PATH:~/.local/bin"
# https://qiita.com/nmrmsys/items/03f97f5eabec18a3a18b
if [[ ${SHLVL} = 1 ]]; then
  tmuxinator s quarter
fi

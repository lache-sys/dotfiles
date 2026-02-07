#!/usr/bin/env zsh
# ====================
#
# bison
#
# ====================
export LDFLAGS="-L/opt/homebrew/opt/bison/lib"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
# ====================
#
# Bitwarden
#
# ====================
if [[ "$(uname)" == "Darwin" ]]; then
  export SSH_AUTH_SOCK=${HOME}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
elif [[ "$(uname)" == "Linux" ]]; then
  export SSH_AUTH_SOCK=${HOME}/.bitwarden-ssh-agent.sock
fi
# ====================
#
# Homebrew
#
# ====================
if [[ "$(uname)" == "Darwin" && "$(uname -m)" == "arm64" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
if [[ "$(uname)" == "Darwin" || "$(uname)" == "Linux" ]]; then
  export HOMEBREW_NO_ANALYTICS=1
fi
# ====================
#
# Wine
#
# ====================
LDFLAGS="-Wl,-rpath,/opt/X11/lib"

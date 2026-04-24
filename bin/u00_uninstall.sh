#!usr/bin/env bash
readonly BREWFILE="${HOME}/.Brewfile"
readonly DOTDIR="$(dirname $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P))"
readonly SUDOL="/etc/pam.d/sudo_local"
readonly SCR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$(cd "$(dirname "$0")"; pwd)"
for i in ${HOME}/.*; do
  if [[ -L ${i} ]]; then
    unlink -- ${i}
  fi
done
for i in ${HOME}/.config/*/; do
  if [[ -L ${i} ]]; then
    unlink -- ${i}
  fi
done
# Git
rm -fr ${HOME}/.config/git
if [[ "$(uname)" == "Darwin" ]]; then
# Mac App Store
  sudo mas uninstall --all
# Reset sudo settings
  if [[ "$(uname -m)" == "arm64" ]]; then
    if [[ -e ${SUDOL}.bak ]]; then
      sudo mv ${SUDOL}.bak ${SUDOL}_$(date +%Y%m%d_%H%M%S).bak
    fi
    sudo mv ${SUDOL} ${SUDOL}.bak
    sudo touch ${SUDOL}
  fi
fi
# Homebrew
if [[ "$(uname)" == "Darwin" && $(which brew) ]]; then
  touch ${BREWFILE}
  brew bundle cleanup -f -v --global --zap
  rm -f ${BREWFILE}
  if [[ "$(uname -m)" == "arm64" ]]; then
    echo 'Y' | /bin/bash -c "$(NONINTERACTIVE=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    if [[ -e /opt/homebrew ]]; then
      sudo /bin/rm -fr /opt/homebrew
    fi
  elif [[ "$(uname -m)" == "x86_64" ]]; then
    echo 'Y' | /bin/bash -c "$(NONINTERACTIVE=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh) --path /usr/local"
  fi
fi
# General
/bin/rm -fr ${HOME}/.cache
echo "See you again."
exit 0

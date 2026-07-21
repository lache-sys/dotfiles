#!usr/bin/env bash
set -eoux pipefail
if [[ "$(uname)" == "Darwin" ]]; then
  sudo mas uninstall --all
  if [[ $(uname -m) == "arm64" || $(uname -m) == "aarch64" ]]; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  elif [[ $(uname -m) == "x86_64" ]]; then
    SCRTMPDIR=$(mktemp -d)
    SCRTMP=${SCRTMPDIR}/uninstall.sh
    curl -o ${SCRTMP} -fsSLO https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
    /bin/bash ${SCRTMP} --path /usr/local
    sudo rm -rf ${PKGTMPDIR}
  fi
  sudo nix run nix-darwin#darwin-uninstaller
fi
/nix/nix-installer uninstall --no-confirm
echo "See you again!"
exit 0

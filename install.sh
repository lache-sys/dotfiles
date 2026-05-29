#!usr/bin/env bash
if [[ "$(uname)" == "Darwin" ]]; then
  PKGTMPDIR=$(mktemp -d)
  PKGTMP=${PKGTMPDIR}/Determinate.pkg
  curl -L -o ${PKGTMP} https://install.determinate.systems/determinate-pkg/stable/Universal
  sudo installer -pkg ${PKGTMP} -target /
  sudo rm -rf ${PKGTMPDIR}
fi
home-manager switch --flake $(cd "$(dirname "$0")"; pwd)/.config/home-manager
exit 0

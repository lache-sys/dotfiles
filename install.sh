#!usr/bin/env bash
HM_SRC="$(cd "$(dirname "$0")"; pwd)/.config/home-manager"
HM_TGT="${HOME}/.config/home-manager"
if [[ "$(uname)" == "Darwin" ]]; then
  PKGTMPDIR=$(mktemp -d)
  PKGTMP=${PKGTMPDIR}/Determinate.pkg
  curl -L -o ${PKGTMP} https://install.determinate.systems/determinate-pkg/stable/Universal
  sudo installer -pkg ${PKGTMP} -target /
  sudo rm -rf ${PKGTMPDIR}
elif [[ "$(uname)" == "Linux" ]]; then
  curl -fsSL https://install.determinate.systems/nix | sh -s -- install
fi
if [ -d "${HM_SRC}" ]; then
  if [ -L "${HM_TGT}" ] || [ ! -e "${HM_TGT}" ]; then
    ln -sfn "${HM_SRC}" "${HM_TGT}"
  else
    echo "Warning: ${HM_TGT} exists and is not a symlink. Skipping (manual review needed)."
  fi
else
  echo "Warning: ${HM_SRC} does not exist. Skipping agents symlink."
fi
cd ${HM_SRC}
nix flake update
home-manager switch --flake .
if [[ "$(uname)" == "Darwin" ]]; then
  sudo nix run nix-darwin -- switch --flake .#lache-sys-darwin
  eval "$(/usr/local/bin/brew shellenv)"
  UV_PYTHON=$(brew --prefix)/bin/python3 uv venv
fi
exit 0

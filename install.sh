#!usr/bin/env bash
set -eou pipefail
HM_SRC="$(cd "$(dirname "$0")"; pwd)/.config/home-manager"
HM_TGT="${HOME}/.config/home-manager"
SCR_DIR="$(cd "$(dirname "$0")"; pwd)"
if [[ "$(uname)" == "Darwin" ]]; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ $(uname -m) == "arm64" || $(uname -m) == "aarch64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ $(uname -m) == "x86_64" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes --no-confirm
. /etc/profile.d/nix.sh
if [[ ! -d "${HOME}/.config" ]]; then
  mkdir -p "${HOME}/.config"
fi
if [[ -d "${HM_SRC}" ]]; then
  if [[ -L "${HM_TGT}" || ! -e "${HM_TGT}" ]]; then
    ln -sfn "${HM_SRC}" "${HM_TGT}"
  else
    echo "Warning: ${HM_TGT} exists and is not a symlink. Skipping (manual review needed)."
  fi
else
  echo "Warning: ${HM_SRC} does not exist. Skipping agents symlink."
fi
cd ${HM_SRC}
nix flake update
nix run home-manager/master -- switch --flake .
home-manager switch --flake .
if [[ "$(uname)" == "Darwin" ]]; then
  sudo nix run nix-darwin -- switch --flake .#lache-sys-darwin
fi
cd ${HOME}
UV_VENV_CLEAR=1 uv venv --python 3.14
source ~/.venv/bin/activate
uv pip install -r "${SCR_DIR}/cfg/uv.txt"
exit 0

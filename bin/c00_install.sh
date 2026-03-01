#!/usr/bin/env bash
set -eou pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"
source x00_var.sh
source c11_link.sh
if [[ "$(uname)" == "Darwin" ]]; then
  source m01_init.sh
  if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ "$(uname -m)" == "x86_64" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  source m02_defaults.sh
  source m03_finder.sh
  source m04_brew.sh
  eval "$(/usr/libexec/path_helper)"
  cd "${SCR_DIR}"
  source m05_tlmgr.sh
  source m06_sudo.sh
fi
if [[ "$(uname)" == "Linux" ]]; then
  if [[ -e /etc/arch-release ]]; then
    source p10_pacman.sh
  elif [[ -e /etc/debian_version || -e /etc/debian_release ]]; then
    source d10_apt.sh
  elif [[ $(grep "^ID=" /etc/os-release | awk -F= '{print $2}') == "alpine" ]]; then
    source a10_apk.sh
  fi
fi
cd "${SCR_DIR}"
source c20_uv_pre.sh
source ~/.venv/bin/activate
cd "${SCR_DIR}"
if [[ "$(uname)" == "Darwin" ]]; then
  source c30_uv_post.sh
fi
exit 0

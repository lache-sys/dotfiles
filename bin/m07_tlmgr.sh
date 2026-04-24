#!usr/bin/env bash
set -euo pipefail
cd $(cd "$(dirname "$0")"; pwd)
if $(which tlmgr); then
  sudo tlmgr update --self
  while read line; do
    sudo tlmgr install ${line}
  done < "$(basename ${BASH_SOURCE[0]} .sh).txt"
fi
return 0

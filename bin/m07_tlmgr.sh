#!usr/bin/env bash
set -euo pipefail
cd $(cd "$(dirname "$0")"; pwd)
sudo tlmgr update --self
while read line; do
  sudo tlmgr install ${line}
done < "$(basename ${BASH_SOURCE[0]} .sh).txt"
return 0

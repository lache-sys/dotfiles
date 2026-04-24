#!usr/bin/env bash
set -euo pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
ZP=${HOME}/.zprofile
cd "${SCR_DIR}"
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# if [[ "$(uname -m)" = "arm64" && ! -e ${ZP} ]] ; then
#   (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ${ZP}
# fi
eval "$(/opt/homebrew/bin/brew shellenv)"
# Install xcode
# Check if command line tools are installed
if ! xcode-select --print-path &> /dev/null; then
  # Install command line tools
  echo "Command line tools not found. Installing..."
  echo 'Y' | xcode-select --install
else
  echo "Command line tools are already installed."
fi
return 0

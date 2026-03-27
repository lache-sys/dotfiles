#!usr/bin/env bash
set -euo pipefail
BFF="${HOME}/.brew/.Brewfile_formulae"
brew bundle --file ${BREWFILE}
brew bundle cleanup -f -v --file ${BREWFILE}
return 0

#!usr/bin/env bash
set -euo pipefail
BFF="${HOME}/.brew/Brewfile_formulae"
brew bundle --file ${BFF}
brew bundle cleanup -f -v --file ${BFF}
return 0

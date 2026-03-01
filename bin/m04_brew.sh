#!usr/bin/env bash
set -euo pipefail
MENU="minimal mas rosetta full"
PS3="Choose your option (1-4):"
if [[ -f ~/.Brewfile ]]; then
  rm ~/.Brewfile
elif [[ -L ~/.Brewfile ]]; then
  unlink -- ~/.Brewfile
fi
select val in ${MENU}; do
  case ${val} in
    minimal)
      cat ~/.Brewfile_{basic,cargo} >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    mas|rosetta)
      cat ~/.Brewfile_{basic,cargo,${val}} >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    full)
      cat ~/.Brewfile_* >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f --global
      rm ~/.Brewfile
      break
      ;;
    *)
      echo "Please enter valid number again!"
      ;;
  esac
done
return 0

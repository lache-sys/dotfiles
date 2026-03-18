#!usr/bin/env bash
set -euo pipefail
BFDIR="${HOME}/.brew"
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
      cat ${BFDIR}/.Brewfile_{basic,cargo} >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    mas|rosetta)
      cat ${BFDIR}/.Brewfile_{tap,basic,${val},cargo} >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    full)
      cat ${BFDIR}/.Brewfile_* >> ~/.Brewfile
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

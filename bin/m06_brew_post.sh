#!usr/bin/env bash
set -euo pipefail
BFDIR="${HOME}/.brew"
MENU="minimal casks mas rosetta full"
PS3="Choose your option (1-5):"
if [[ -f ~/.Brewfile ]]; then
  rm ~/.Brewfile
elif [[ -L ~/.Brewfile ]]; then
  unlink -- ~/.Brewfile
fi
select val in ${MENU}; do
  case ${val} in
    minimal)
      cat ${BFDIR}/Brewfile_{formulae,cargo} >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    casks)
      cat ${BFDIR}/Brewfile_{formulae,casks,cargo} >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    mas)
      cat ${BFDIR}/Brewfile_{formulae,casks,${val},cargo} >> ~/.Brewfile
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    rosetta)
      cat ${BFDIR}/Brewfile_{formulae,casks,${val},cargo} >> ~/.Brewfile
      sudo softwareupdate --install-rosetta
      brew bundle --global -v
      brew bundle cleanup -f -v --global
      rm ~/.Brewfile
      break
      ;;
    full)
      cat ${BFDIR}/Brewfile_* >> ~/.Brewfile
      sudo softwareupdate --install-rosetta
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

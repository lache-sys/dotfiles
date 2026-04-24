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
      brew bundle -v --global
      brew bundle cleanup -f -v --global --zap
      rm ~/.Brewfile
      break
      ;;
    casks)
      cat ${BFDIR}/Brewfile_{formulae,casks,cargo} >> ~/.Brewfile
      brew bundle -v --global
      brew bundle cleanup -f -v --global --zap
      rm ~/.Brewfile
      break
      ;;
    mas)
      cat ${BFDIR}/Brewfile_{formulae,casks,${val},cargo} >> ~/.Brewfile
      brew bundle -v --global
      brew bundle cleanup -f -v --global --zap
      rm ~/.Brewfile
      break
      ;;
    rosetta)
      cat ${BFDIR}/Brewfile_{formulae,casks,${val},cargo} >> ~/.Brewfile
      echo 'A' | sudo softwareupdate --install-rosetta
      brew bundle -v --global
      brew bundle cleanup -f -v --global --zap
      rm ~/.Brewfile
      break
      ;;
    full)
      cat ${BFDIR}/Brewfile_* >> ~/.Brewfile
      echo 'A' | sudo softwareupdate --install-rosetta
      brew bundle -v --global
      brew bundle cleanup -f -v --global --zap
      rm ~/.Brewfile
      break
      ;;
    *)
      echo "Please enter valid number again!"
      ;;
  esac
done
return 0

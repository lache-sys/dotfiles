#!usr/bin/env bash
set -euo pipefail
readonly bak_dir="$HOME/.dotbackup"
function cfg2homedir () {
  for f in ${dotdir}/${1}/**; do
    ln -snf ${f} $HOME/${1}/$(basename ${f})
  done
}
function check_homedir () {
  if [[ "$HOME" != "$dotdir" ]]; then
    for f in $1/.??*; do
      if [[ "${f}" == "$1/.config" || "${f}" == "$1/.zsh" ]]; then
        continue
      fi
      if [[ -L "$2/`basename $f`" ]];then
        command rm -f "$2/`basename $f`"
      fi
      if [[ -e "$2/`basename $f`" ]];then
        command mv "$2/`basename $f`" "$3"
      fi
    done
  else
    command echo "same install src dest"
  fi
}
function helpmsg () {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}
function mkdir_w_mes () {
  if [[ ! -d "$1" ]]; then
    command echo "$1 not found. Auto Make it"
    command mkdir "$1"
  fi
}
function lnk2homedir () {
  command echo "backup old dotfiles..."
  for f in $dotdir/.??*; do
    for line in $(cat "${script_dir}/$(basename ${BASH_SOURCE[0]} .sh).txt"); do
      if [[ "$f" == "${dotdir}/${line}" ]]; then
        continue 2
      fi
    done
    command ln -snf $f $HOME
  done
}
function pla_dep () {
  for linklist in "$(basename ${BASH_SOURCE[0]} .sh).tsv" "$(basename ${BASH_SOURCE[0]} .sh)_$(uname).tsv"; do
    [ ! -r "${linklist}" ] && continue
    sed -e 's/\s*#.*//' -e '/^\s*$/d' "${linklist}" | while read target_raw lnk_raw; do
      target="$(eval echo "${PWD}/${target_raw}")"
      lnk="$(eval echo "${lnk_raw}")"
      mkdir -p "$(dirname ${lnk})"
      ln -fsn "${target}" "${lnk}"
    done
  done
  return 0
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

function main () {
  mkdir_w_mes "${bak_dir}"
  check_homedir ${dotdir} $HOME ${bak_dir}
  mkdir_w_mes "$HOME/.config"
  lnk2homedir
  check_homedir ${dotdir}.config $HOME/.config "${bak_dir}/.config"
  cfg2homedir .config
  git config --global include.path "~/.gitconfig_shared"
  command echo -e "Install completed!!!!"
}
main "$@"

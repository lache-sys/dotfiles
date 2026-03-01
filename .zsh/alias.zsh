#!/usr/bin/env zsh
alias 7za='7zz a -mmt=on -mx=9 -sdel'
alias cat='bat --paging=never'
alias cdr2iso='for i in *.cdr; do hdiutil makehybrid -iso -joliet -o $(basename ${i} .cdr).iso ${i}; done'
alias chd2iso_cd='chd2iso_main'
alias clamddl='clamdscan ~/Downloads -i -m --remove'
alias clamdf='clamdf_main'
alias clamdl='clamscan ~/Downloads -r --infected --remove'
alias cut4dl='cut4dl_main'
alias d2u='dos2unix'
alias flac2wav='for i in *.flac; do flac -d ${i}; done'
alias fluidall='for i in *.mid; do fluidsynth ${i}; done'
alias gaa='git add -A'
alias gcsm='git commit -S -m'
alias gp='git push'
alias gpa='gpa_main'
alias gsa='git submodule add'
alias img2webp='img2webp_main'
alias lsg='lsg_main'
alias mamew='mame -window'
alias md2icml='for i in *.md; do pandoc -i ${i} -s -o $(basename ${i} .md).icml; done'
alias mdt='markdown-toc --bullets "-" -i'
alias mkdire='mkdire_main'
alias mpva='mpv --profile=aud'
alias mpvas='mpv --profile=aud-shuffle'
alias mpvs='mpv --profile=shuffle'
alias ls='eza --icons --group-directories-first'
alias pullall='pullall_main'
alias rib='rib_main'
alias rpds='rpds_main'
alias smart='smartctl -a'
alias timidityall='for i in *.mid; do timidity --module=3 -Od ${i}; done'
alias vhdx2qcow2='for i in *.vhdx; do qemu-img convert -f vmdk -O qcow2 ${i} $(basename ${i} .vhdx).qcow2; done'
alias vvim='vim -u NONE -N'
alias wav2flac='for i in *.wav; do flac -8 -f ${i}; done'
alias zrc='source ~/.zshrc'
if [[ "$(uname)" == "Darwin" ]]; then
  alias bbc='brew bundle cleanup -f --global'
  alias bbd='brew bundle dump -f --global'
  alias bucg='brew upgrade --cask -g'
  alias bupd='brew update'
  alias bupg='brew upgrade'
fi
function chd2iso_cd_main () {
  for i in *.chd; do
    _chd_bn=$(basename ${i} .chd)
    chdman extractcd -i ${i} -o ${i}.cue -ob ${i}.iso
  done
  return 0
}
function clamdf_main () {
  cd "$(dirname "${1}")"
  clamdscan -i -m --remove -f "${1}"
  return 0
}
function cut4dl_main () {
  _i=0
  cd ~/Downloads
  cut -d ',' -f 2 "${1}" | sed -e '1,2d' > req.txt
  while read LINE; do
    _origname=$(basename ${LINE})
    _ext=${_origname##*.}
    _i=$((_i+1))
    _i4=$(printf "%04d" "${_i}")
    wget -O ${_i4}.${_ext} ${LINE}
  done < req.txt
  rm -f req.txt
  return 0
}
function gpa_main () {
  _gh_dir="${HOME}/GitHub"
  _pwd=${PWD}
  cd ${_gh_dir}
  for i in */; do
    cd ${i}
    if [[ $(git fetch) ]]; then
      git pull
    fi
    cd ..
  done
  cd ${_pwd}
  return 0
}
function img2webp_main () {
  _pwd=${PWD}
  export CPPFLAGS="-I/opt/homebrew/opt/ffmpeg-full/include"
  export LDFLAGS="-L/opt/homebrew/opt/ffmpeg-full/lib"
  export PATH="/opt/homebrew/opt/ffmpeg-full/bin:$PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg-full/lib/pkgconfig"
  cd "${_pwd}"
  for i in *${1}; do
    ffmpeg -i ${i} -lossless 1 $(basename ${i} ${1}).webp
  done
  return 0
}
function lsg_main () {
  _pwd=${PWD}
  cd ${1}
  for i in */; do
    cd ${i}
    _gss=$(git status -s)
    if [[ ${_gss} ]]; then
      echo "${i}"
      git status -s
    fi
    cd ..
  done
  cd ${_pwd}
  return 0
}
function mkdire_main () {
  for i in $(seq 1 ${2}); do
    mkdir "emg__$(printf %01d ${1})-$(printf %02d ${i})"
  done
  return 0
}
function kbm_ogg_main () {
  for i in *.ogg; do
    _bitrate_raw=$(ffprobe -v quiet -show_entries stream=bit_rate -of default=noprint_wrappers=1:nokey=1 ${i})
    _bitrate=$(numfmt ${_bitrate_raw} --to=si --format "%.0f")
    mv ${i} "${i}.bak"
    ffmpeg -i "${i}.bak" -c:a libvorbis ${i}
  done
  return 0
}
function vid2av1_main () {
  for i in *${1}; do
    mv ${i} "${i}.bak"
    ffmpeg -i ${i} -c:v libsvtav1 -crf 35 "$(basename ${i} ${1}).mkv"
  done
  return 0
}
function ppp_aud_main () {
  for i in *${1}; do
    _txt="$(basename ${i} ${1}).txt"
    echo "file ${i}.bak" > ${_txt}
    mv ${i} "${i}.bak"
    ffmpeg -f concat -i ${_txt} -safe 0 -acodec copy -vn ${i}
    rm ${_txt}
  done
  return 0
}
function ppp_ogg_main () {
  for i in *.ogg; do
    _bitrate_raw=$(ffprobe -v quiet -show_entries stream=bit_rate -of default=noprint_wrappers=1:nokey=1 ${i})
    _bitrate=$(numfmt ${_bitrate_raw} --to=si --format "%.0f")
    mv ${i} "${i}.bak"
    ffmpeg -i "${i}.bak" -c:a libopus -b:a ${_bitrate} ${i}
  done
  return 0
}
function ppp_vid_main () {
  for i in *${1}; do
    _txt="$(basename ${i} ${1}).txt"
    echo "file ${i}.bak" > ${_txt}
    mv ${i} "${i}.bak"
    ffmpeg -f concat -i ${_txt} -safe 0 -c copy ${i}
    rm ${_txt}
  done
  return 0
}
function pullall_main () {
 for i in ${HOME}/GitHub/*/; do
   cd ${i}
   git fetch
   git pull
   cd ..
  done
}
function rib_main () {
  _tgt="${HOME}/Library/Application Support/MobileSync/Backup"
  unlink -- ${_tgt}
  ln -s ${1} ${_tgt}
  return 0
}
function rpds_main () {
  _dd_of="${HOME}/Downloads/tmp.img"
  dd if=/dev/random of=${_dd_of} bs=1073741824 count=${1}
  return 0
}

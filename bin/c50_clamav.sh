#!usr/bin/env bash
set -euo pipefail
readonly ULVRC="/usr/local/var/run/clamav"
case "$(uname)" in
  "Darwin")
    readonly CLAMAV_DIR="/opt/homebrew/etc/clamav";;
  "Linux")
    readonly CLAMAV_DIR="/etc/clamav";;
  *)
    echo "Neither macOS or Linux!"
    exit 1
esac
if [[ ! -f "${CLAMAV_DIR}/clamd.conf" ]]; then
  cp ${CLAMAV_DIR}/clamd.conf.sample ${CLAMAV_DIR}/clamd.conf
  sed -i '' -e 's/^Example$/# Example/g' ${CLAMAV_DIR}/clamd.conf
  sed -i '' -e 's/^#LocalSocket \/tmp\/clamd.sock/LocalSocket \/tmp\/clamd.sock/g' ${CLAMAV_DIR}/clamd.conf
  sed -i '' -e 's/^#TCPAddr localhost/TCPAddr localhost/g' ${CLAMAV_DIR}/clamd.conf
else
  :
fi
if [[ ! -f "${CLAMAV_DIR}/freshclam.conf" ]]; then
  cp ${CLAMAV_DIR}/freshclam.conf.sample ${CLAMAV_DIR}/freshclam.conf
  sed -i '' -e 's/^Example$/# Example/g' ${CLAMAV_DIR}/freshclam.conf
else
  :
fi
if [[ ! -e "${ULVRC}" ]]; then
  sudo mkdir -p ${ULVRC}
fi
freshclam -v
if [[ "$(uname)" == "Darwin" ]]; then
  if ps ax | grep [c]lamd &> /dev/null; then
    echo "clamd running"
  else
    clamd
  fi
fi
exit 0

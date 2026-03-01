#!usr/bin/env bash
set -euo pipefail
SUDO_LOCAL="/etc/pam.d/sudo_local"
if [[ -e ${SUDO_LOCAL} ]]; then
  sudo cp ${SUDO_LOCAL} ${SUDO_LOCAL}.bak
fi
SL1="auth       optional       $(brew --prefix)/lib/pam/pam_reattach.so"
SL2="
auth       sufficient     pam_tid.so
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so
"
SL0="${SL1}""${SL2}"
sudo tee ${SUDO_LOCAL} <<< ${SL0}
return 0

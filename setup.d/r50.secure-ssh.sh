#!/usr/bin/env bash

set -Eeumox pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

source "${SELF_DIR}/functions.sh"

SSH_CONFIG="/etc/ssh/sshd_config"
backup "${SSH_CONFIG}"

sed -i 's/^#\{0,1\}PermitRootLogin.*$/PermitRootLogin no/g ; t ; q10' "$SSH_CONFIG" \
  || echo "PermitRootLogin no" >> "$SSH_CONFIG"
sed -i 's/^#\{0,1\}X11Forwarning.*$/X11Forwarding no/g ; t ; q10' "$SSH_CONFIG" \
  || echo "X11Forwarding no" >> "$SSH_CONFIG"

systemctl restart sshd

echo 'PLEASE CONFIGURE 2FA FOR SSH!'

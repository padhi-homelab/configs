#!/usr/bin/env bash

set -Eeumox pipefail

SSH_CONFIG="/etc/ssh/sshd_config"

if [ -f "${SSH_CONFIG}.bak" ]; then
  cp "${SSH_CONFIG}.bak" "${SSH_CONFIG}"
else
  cp "${SSH_CONFIG}" "${SSH_CONFIG}.bak"
fi

cat <<EOF >> "$SSH_CONFIG"

PermitRootLogin no
X11Forwarding no
EOF

echo 'sshd: ALL' > /etc/hosts.deny

cat <<EOF >> /etc/hosts.allow
sshd : 10.7.3.0/24
sshd : 127.0.0.1
sshd : [::1]
EOF

systemctl restart sshd

echo 'PLEASE CONFIGURE 2FA FOR SSH!'

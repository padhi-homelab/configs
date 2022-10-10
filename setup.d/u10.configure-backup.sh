#!/usr/bin/env bash

set -Eeumox pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

source "${SELF_DIR}/functions.sh"

systemctl --user daemon-reload
systemctl --user enable backup.timer
systemctl --user start backup.timer
systemctl --user status backup.timer

# systemd timers run only when user is logged in,
# so we need to enable lingering:
# https://wiki.archlinux.org/index.php/Systemd/User#Automatic_start-up_of_systemd_user_instances
loginctl enable-linger ${USER}

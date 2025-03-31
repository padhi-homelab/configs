#!/usr/bin/env bash

set -Eeumox pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

source "${SELF_DIR}/functions.sh"

mkdir /backup

systemctl daemon-reload
systemctl enable --now backup.automount
systemctl status backup.automount
systemctl status backup.mount

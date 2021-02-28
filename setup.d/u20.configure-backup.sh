#!/usr/bin/env bash

set -Eeumox pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

source "${SELF_DIR}/functions.sh"

systemctl --user daemon-reload
systemctl --user enable backup.timer
systemctl --user start backup.timer
systemctl --user status backup.timer

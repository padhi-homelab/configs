#!/usr/bin/env bash

set -Eeumox pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

source "${SELF_DIR}/functions.sh"

ARMBIAN_UPDATES_CONFIG="/etc/apt/apt.conf.d/02-armbian-periodic"
backup "${ARMBIAN_UPDATES_CONFIG}"

replace_or_add "^\(\/\/\)\{0,1\}APT::Periodic::Unattended-Upgrade.*$" \
               "APT::Periodic::Unattended-Upgrade \"0\";" \
               "$ARMBIAN_UPDATES_CONFIG"
replace_or_add "^\(\/\/\)\{0,1\}APT::Periodic::Update-Package-Lists.*$" \
               "APT::Periodic::Update-Package-Lists \"1\";" \
               "$ARMBIAN_UPDATES_CONFIG"
replace_or_add "^\(\/\/\)\{0,1\}APT::Periodic::AutocleanInterval.*$" \
               "APT::Periodic::AutocleanInterval \"30\";" \
               "$ARMBIAN_UPDATES_CONFIG"

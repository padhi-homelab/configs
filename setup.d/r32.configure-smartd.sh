#!/usr/bin/env bash

set -Eeumox pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

source "${SELF_DIR}/functions.sh"

SMARTD_CONFIG="/etc/smartd.conf"
backup "${SMARTD_CONFIG}"

sed -i 's/^DEVICESCAN/#DEVICESCAN/g' "${SMARTD_CONFIG}"

echo "DEVICESCAN -a -d ata -d removable -d sat -d scsi -n standby -m root -M exec /usr/share/smartmontools/smartd-runner" >> "${SMARTD_CONFIG}"

SMARTMONTOOLS_CONFIG="/etc/default/smartmontools"
backup "${SMARTMONTOOLS_CONFIG}"

replace_or_add "^#\{0,1\}start_smartd=.*$" \
               "start_smartd=yes" \
               "$SMARTMONTOOLS_CONFIG"
replace_or_add "^#\{0,1\}smartd_opts=.*$" \
               "smartd_opts=\" --interval=300 --quit=never \"" \
               "$SMARTMONTOOLS_CONFIG"

sed -i 's///g ; t ; q10' "${SMARTMONTOOLS_CONFIG}" \
  || echo "start_smartd=yes" >> "${SMARTMONTOOLS_CONFIG}"
sed -i 's///g ; t ; q10' "${SMARTMONTOOLS_CONFIG}" \
  || echo "" >> "${SMARTMONTOOLS_CONFIG}"

systemctl restart smartd
systemctl restart smartmontools

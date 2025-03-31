#!/usr/bin/env bash

set -Eeumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

cd "${SELF_DIR}"/../root

rsync -avhu --progress . /

chown -R root /etc/fail2ban/jail.local
chmod 600 /etc/fail2ban/jail.local

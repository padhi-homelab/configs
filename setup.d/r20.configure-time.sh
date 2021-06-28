#!/usr/bin/env bash

set -Eeumox pipefail

timedatectl set-timezone America/New_York
timedatectl set-ntp yes

systemctl restart systemd-timesyncd

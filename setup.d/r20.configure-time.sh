#!/usr/bin/env bash

set -Eeumox pipefail

timedatectl set-timezone America/Los_Angeles
timedatectl set-ntp yes

systemctl restart systemd-timesyncd

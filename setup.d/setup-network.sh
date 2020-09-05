#!/usr/bin/env bash

set -Eeumox pipefail

hostname

read -p "Please enter the new hostname: " NEW_HOSTNAME

hostnamectl set-hostname $NEW_HOSTNAME
echo '127.0.0.1 $NEW_HOSTNAME' >> /etc/hosts

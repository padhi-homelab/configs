#!/usr/bin/env bash

set -Eeumox pipefail

apt update -yq
apt dist-upgrade -yq
apt install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    fail2ban \
    gnupg-agent \
    libpam-oath \
    libpam-u2f \
    oathtool \
    pamu2fcfg \
    rsync \
    software-properties-common \
    vim
apt autoclean -yq
apt autoremove -yq --purge

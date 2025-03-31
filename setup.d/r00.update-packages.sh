#!/usr/bin/env bash

set -Eeumox pipefail

for i in "$@" ; do [[ $i == "-a" ]] && NO_ARMHF="yes" && break ; done

if [ "$NO_ARMHF" == "yes" ]; then
  apt-get purge ".*:armhf" >/dev/null 2>&1
  dpkg --remove-architecture armhf >/dev/null 2>&1
fi

apt purge -yq \
    chrony \
    *btrfs* \
    *wireless* \
    *wireguard* \
    unattended-upgrades
apt autoremove -yq --purge

apt update -yq
apt dist-upgrade -yq

apt install -yq \
    apt-listbugs \
    apt-listchanges \
    apt-transport-https \
    armbian-config \
    bsdmainutils \
    byobu \
    ca-certificates \
    curl \
    fail2ban \
    htop \
    nfs-common \
    rsync \
    smartmontools \
    systemd-timesyncd \
    vim \
    zstd

apt autoremove -yq --purge
apt autoclean -yq

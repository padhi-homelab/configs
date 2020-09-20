#!/usr/bin/env bash

set -Eeumox pipefail

for i in "$@" ; do [[ $i == "-a" ]] && NO_ARMHF="yes" && break ; done

if [ "$NO_ARMHF" == "yes" ]; then
  apt-get purge ".*:armhf"
  dpkg --remove-architecture armhf
fi

apt update -yq
apt dist-upgrade -yq
apt install -yq \
    apt-transport-https \
    armbian-config \
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

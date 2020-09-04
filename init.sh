#!/usr/bin/env bash

set -Eeumo pipefail

apt update -yq
apt install -yq git

cd /opt
git clone https://github.com/padhi-homelab/configs.git
cd configs
bash setup.sh "$@"

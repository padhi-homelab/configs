#!/usr/bin/env bash

set -Eeumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

cd "${SELF_DIR}"/setup.d

sudo bash install-packages.sh
sudo bash install-docker.sh

sudo bash copy-root-files.sh
sudo bash setup-network.sh

sudo bash register-u2f.sh
sudo bash enable-u2f.sh

sudo bash secure-ssh.sh

clone-services.sh

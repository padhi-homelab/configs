#!/usr/bin/env bash

set -Eeumo pipefail

sudo -i -u user bash << EOF
whoami
cd ~
git clone --no-checkout \
    https://github.com/padhi-homelab/services.git
cd services

if ! command -v git sparse-checkout &> /dev/null ; then
    git sparse-checkout init --cone
    git sparse-checkout add service.sh LICENSE
else
    git config core.sparsecheckout true
    echo "LICENSE" >> .git/info/sparse-checkout
    echo "service.sh" >> .git/info/sparse-checkout
    echo "netdata/*" >> .git/info/sparse-checkout
    git checkout master
    git pull
fi
EOF

# Test docker and docker-compose
docker version
docker-compose version

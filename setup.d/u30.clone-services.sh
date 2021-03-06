#!/usr/bin/env bash

set -Eeumo pipefail

whoami
cd $HOME
git clone --no-checkout \
    https://github.com/padhi-homelab/services.git
cd services

if ! command -v git sparse-checkout &> /dev/null ; then
    git sparse-checkout init --cone
    git sparse-checkout add "LICENSE" "service.sh" "netdata/*"
else
    git config core.sparsecheckout true
    echo "LICENSE" >> .git/info/sparse-checkout
    echo "service.sh" >> .git/info/sparse-checkout
    echo "netdata/*" >> .git/info/sparse-checkout
    git checkout master
    git pull
fi

docker version
docker-compose version

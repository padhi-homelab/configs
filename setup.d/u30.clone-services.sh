#!/usr/bin/env bash

set -Eeumo pipefail

cd $HOME
git clone --no-checkout \
    https://github.com/padhi-homelab/services.git
cd services

git config core.sparsecheckout true

cat <<EOF >.git/info/sparse-checkout
LICENSE

composition.sh

*.global.*
_scripts/*

docker.sock/*
netdata/*
traefik/*
EOF

git checkout master
git pull

./composition.sh

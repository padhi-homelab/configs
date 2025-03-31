#!/usr/bin/env bash

set -Eeumo pipefail

cd $HOME
git clone --no-checkout \
    https://github.com/padhi-homelab/services.git
cd services

git config core.sparsecheckout true

cat <<EOF >.git/info/sparse-checkout
LICENSE

comp

*.global.*
_scripts/*

beszel-agent/*
docker_sock/*
traefik/*
EOF

git checkout master
git pull

./comp p beszel-agent traefik

mkdir -p $HOME/.docker/cli-plugins
cp $HOME/services/.lib/compose \
   $HOME/.docker/cli-plugins/docker-compose

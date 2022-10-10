#!/usr/bin/env bash

set -Eeumo pipefail

VERSION=2.11.2

mkdir -p $HOME/.docker/cli-plugins
cd $HOME/.docker/cli-plugins

wget 'https://github.com/docker/compose/releases/download/v${VERSION}/docker-compose-linux-x86_64'
mv docker-compose-linux-x86_64 docker-compose
chmod +x docker-compose

docker version
docker compose version

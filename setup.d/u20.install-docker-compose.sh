#!/usr/bin/env bash

set -Eeumo pipefail

VERSION=2.12.2

case "$(uname -m)" in
  x86_64  )            ARCH="amd64" ;;
  aarch64 )            ARCH="aarch64" ;;
  arm     | armv7l )   ARCH="armv7" ;;
  ppc64   )            ARCH="ppc64le" ;;
  s390x   )            ARCH="s390x" ;;
  * )                  exit 1 ;;
esac

mkdir -p $HOME/.docker/cli-plugins
cd $HOME/.docker/cli-plugins

wget "https://github.com/docker/compose/releases/download/v${VERSION}/docker-compose-linux-${ARCH}"
mv docker-compose-linux-${ARCH} docker-compose
chmod +x docker-compose

docker version
docker compose version

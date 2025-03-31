#!/usr/bin/env bash

set -Eeumo pipefail

apt purge -yq \
    containerd \
    docker \
    docker.io \
    docker-doc \
    docker-compose \
    docker-engine \
    podman-docker \
    runc \
  || true

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

cat <<EOF | tee /etc/apt/sources.list.d/docker.sources
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(lsb_release -cs)
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

apt update -yq
apt install -yq \
    docker-ce \
    docker-ce-cli \
    containerd.io

docker run hello-world
docker system prune --all --force

groupadd docker || true
usermod -aG docker user

systemctl enable docker

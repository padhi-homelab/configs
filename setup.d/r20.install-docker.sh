#!/usr/bin/env bash

set -Eeumo pipefail

apt purge -yq \
    containerd \
    docker \
    docker.io \
    docker-engine \
    runc \
  || true

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88

add-apt-repository \
    "deb [arch=arm64]
    https://download.docker.com/linux/debian \
    $(lsb_release -cs)
    stable"

apt update -yq
apt install -yq \
    docker-ce \
    docker-ce-cli \
    containerd.io \
 || true 1                     # Some weird error during installation

docker run hello-world
docker system prune --all --force

groupadd docker || true
usermod -aG docker user

systemctl enable docker

cd /usr/local/bin
curl -L --fail --output docker-compose \
     https://raw.githubusercontent.com/padhi-homelab/docker_compose/master/run.sh
chmod 755 docker-compose

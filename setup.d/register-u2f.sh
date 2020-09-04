#!/usr/bin/env bash

set -Eeumo pipefail

mkdir -p /etc/u2f

echo 'Please tap your U2F key to register:'
pamu2fcfg -u user > /etc/u2f/users

chown -R root /etc/u2f
chmod 600 /etc/u2f/*

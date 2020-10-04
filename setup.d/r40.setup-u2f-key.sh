#!/usr/bin/env bash

set -Eeumo pipefail

mkdir -p /etc/u2f

echo 'Please tap your U2F key to register:'
pamu2fcfg -u user > /etc/u2f/users

chown -R root /etc/u2f
chmod 600 /etc/u2f/*

cd /etc/pam.d

sed -i 's#include common-auth#include strict-local-auth#g' chfn
sed -i 's#include common-auth#include strict-local-auth#g' chsh
sed -i 's#include common-auth#include strict-local-auth#g' cron
sed -i 's#include common-auth#include strict-local-auth#g' login
sed -i 's#include common-auth#include strict-local-auth#g' other
sed -i 's#include common-auth#include strict-local-auth#g' polkit-1
sed -i 's#include common-auth#include strict-local-auth#g' su

sed -i 's#include common-auth#include fast-local-auth#g' sudo

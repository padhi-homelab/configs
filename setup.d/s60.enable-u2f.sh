#!/usr/bin/env bash

set -Eeumo pipefail

cd /etc/pam.d

sed -i 's#include common-auth#include strict-local-auth#g' chfn
sed -i 's#include common-auth#include strict-local-auth#g' chsh
sed -i 's#include common-auth#include strict-local-auth#g' cron
sed -i 's#include common-auth#include strict-local-auth#g' login
sed -i 's#include common-auth#include strict-local-auth#g' other
sed -i 's#include common-auth#include strict-local-auth#g' polkit-1
sed -i 's#include common-auth#include strict-local-auth#g' su

sed -i 's#include common-auth#include fast-local-auth#g' sudo

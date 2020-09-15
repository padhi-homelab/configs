#!/usr/bin/env bash

set -Eeumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

cd "${SELF_DIR}"/setup.d

if [ -z "$1" ] || [ "$1" == "root" ]; then
  for root_script in r*.sh ; do
    echo -e "\n@ ${root_script}:"
    sudo bash "${root_script}"
  done
fi

if [ -z "$1" ] || [ "$1" == "user" ]; then
  for user_script in u*.sh ; do
    echo -e "\n@ ${user_script}:"
    sudo -iu user bash "$(pwd)/${user_script}"
  done
fi

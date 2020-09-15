#!/usr/bin/env bash

set -Eeumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

cd "${SELF_DIR}"/setup.d

for sudo_script in s*.sh ; do
  echo -e "\n@ ${sudo_script}:"
  sudo bash ${sudo_script}
done

for user_script in s*.sh ; do
  echo -e "\n@ ${user_script}:"
  sudo bash ${user_script}
done

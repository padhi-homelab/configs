#!/usr/bin/env bash

set -Eeumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

cd "${SELF_DIR}"/../home

rsync -avhu --progress . ${HOME}

chmod +x ${HOME}/backup.sh

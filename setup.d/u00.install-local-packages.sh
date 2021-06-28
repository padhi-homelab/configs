#!/usr/bin/env bash

set -Eeumo pipefail

pip3 install yq

echo -e "export PATH=\$HOME/.local/bin:\$PATH" >> $HOME/.bashrc

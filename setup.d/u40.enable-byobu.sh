#!/usr/bin/env bash

set -Eeumo pipefail

cd $HOME

byobu-enable
mkdir -p $HOME/.byobu/bin

touch $HOME/.byobu/.always-select

cat <<EOF >>$HOME/.byobu/profile.tmux
BYOBU_DATE=""
BYOBU_TIME=""
EOF

cat <<EOF >>$HOME/.byobu/bin/99_board
#!/bin/sh

. /etc/armbian-release
echo "#[bg=blue]$BOARD_NAME#[bg=black]"
EOF

BYOBU_STATUS="$HOME/.byobu/status"
backup "${BYOBU_STATUS}"

replace_or_add "^#\{0,1\}tmux_left=.*$" \
               "tmux_left=\"custom uptime reboot_required updates_available session\"" \
               "$BYOBU_STATUS"
replace_or_add "^#\{0,1\}tmux_right=.*$" \
               "tmux_right=\"cpu_temp load_average cpu_count cpu_freq memory disk ip_address\"" \
               "$BYOBU_STATUS"

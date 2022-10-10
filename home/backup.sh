#!/usr/bin/env bash

TIME="$(date +%Y%m%d%H%M%S)"
PREFIX=$HOSTNAME-backup-

SRCS=("/home/user/services" "/home/user/.config/systemd" "/home/user/backup.sh")

FILENAME=$PREFIX$TIME.tar
tar --exclude-vcs -cf "$HOME/$FILENAME" "${SRCS[@]}"

DESTDIR=/backup
cd "$DESTDIR"

MAX_BACKUPS_TO_KEEP=16
ls -1tr "$DESTDIR/$PREFIX"*.tar | head -n -$MAX_BACKUPS_TO_KEEP | while read -r i
do
  rm "$i"
done

mv "$HOME/$FILENAME" .
rm "$HOME/$PREFIX"*.tar

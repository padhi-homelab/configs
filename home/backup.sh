#!/usr/bin/env bash

TIME="$(date +%Y%m%d%H%M%S)"
FILENAME=$TIME.tar

SRCS="/home/user/services /home/user/.config/systemd /home/user/backup.sh"

tar --exclude-vcs -cf "$HOME/$FILENAME" $SRCS

DESTDIR=/backup
cd "$DESTDIR"

MAX_BACKUPS_TO_KEEP=32
ls -1tr "$DESTDIR"/*.tar | head -n -$MAX_BACKUPS_TO_KEEP | while read -r i
do
  rm "$i"
done

mv "$HOME/$FILENAME" .

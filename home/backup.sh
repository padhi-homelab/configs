#!/usr/bin/env bash

DESTDIR=/backup
cd "$DESTDIR"

MAX_BACKUPS_TO_KEEP=32
ls -1tr "$DESTDIR"/*.tar | head -n -$MAX_BACKUPS_TO_KEEP | while read -r i
do
  rm "$i"
done

TIME="$(date +%Y%m%d%H%M%S)"
FILENAME=$TIME.tar

SRCDIR="/home/user/services /home/user/.config/systemd /home/user/backup.sh"

tar cvf "$DESTDIR/$FILENAME" $SRCDIR

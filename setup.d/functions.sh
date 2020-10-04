function backup () {
  if [ -f "$1.orig" ]; then
    cp "$1.orig" "$1"
  else
    cp "$1" "$1.orig"
  fi
}

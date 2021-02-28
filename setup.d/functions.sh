function backup () {
  if [ -f "$1.orig" ]; then
    cp "$1.orig" "$1"
  else
    cp "$1" "$1.orig"
  fi
}

function replace_or_add () {
  sed -i '/'"$1"'/{s//'"$2"'/;h};${x;/./{x;q0};x;q1}' "$3" \
  || echo "$2" >> "$3"
}

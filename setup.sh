#!/usr/bin/env bash

set -Eeumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

usage() {
  if [ $# -gt 0 ]; then echo -e "\nERROR: $1" >&2 ; fi
  echo -en "
Usage: $0 [flag]...

Flags:
  [--no-armhf, -a]      Remove armhf support (on board that support armhf + arm64)
  [--root-scripts, -r]  Only run root setup scripts
  [--user-scripts, -u]  Only run user setup scripts
" >&2 ; exit $EXIT_CODE_USAGE_ERROR
}

[ $# -gt 0 ] || usage

ROOT_SCRIPTS="yes"
USER_SCRIPTS="yes"

for opt in "$@"; do
  shift
  case "$opt" in
    "--no-armhf")     set -- "$@" "-a" ;;

    "--root-scripts") set -- "$@" "-r" ;;
    "--user-scripts") set -- "$@" "-u" ;;

    "--")             set -- "$@" "--" ;;
    "--"*)            usage "Unrecognized option: $opt." ;;
    *)                set -- "$@" "$opt"
  esac
done

OPTIND=1
FORWARD_OPTIONS=''
while getopts ':aru' OPTION ; do
  case "$OPTION" in
    "a" ) FORWARD_OPTIONS+=" -a" ;;
    "r" ) USER_SCRIPTS="no" ;;
    "u" ) ROOT_SCRIPTS="no" ;;

      * ) usage "Unrecognized option: -$OPTARG." ;;
  esac
done
shift $(($OPTIND -1))

cd "${SELF_DIR}"/setup.d

if [ "$ROOT_SCRIPTS" == "yes" ]; then
  for root_script in r*.sh ; do
    echo -e "\n@ ${root_script}:"
    sudo bash "${root_script}" $FORWARD_OPTIONS
  done
fi

if [ "$USER_SCRIPTS" == "yes" ]; then
  for user_script in u*.sh ; do
    echo -e "\n@ ${user_script}:"
    sudo -iu user bash "$(pwd)/${user_script}" $FORWARD_OPTIONS
  done
fi

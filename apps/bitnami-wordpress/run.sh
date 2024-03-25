#!/usr/bin/env bash

set -o errexit
set -o pipefail

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

function kustomizeIt {
  kubectl kustomize \
    --enable-helm \
    "$__DIR/$1"
}

function build {
  kustomizeIt "$1"
}

function delete {
  kustomizeIt "$1" | kubectl delete -f -
}

function apply {
  kustomizeIt "$1" | kubectl apply -f -
}

function validate_overlay_arg {
  if [[ -z $1 ]]; then
    echo "You must specify an overlay to diff: (dev, prod)"
    exit 1
  fi
}

COMMAND=$1
OVERLAY=$2
if [[ ! $OVERLAY == "base" ]]; then
  OVERLAY=overlays/$2
fi

case "$COMMAND" in
  diff)
    validate_overlay_arg "$2"
    diff <(kustomizeIt base) <(kustomizeIt "$OVERLAY") | more
    ;;
  build)
    validate_overlay_arg "$2"
    build "$OVERLAY"
    ;;
  apply)
    validate_overlay_arg "$2"
    apply "$OVERLAY"
    ;;
  delete)
    validate_overlay_arg "$2"
    delete "$OVERLAY"
    ;;
  *) echo "Please specify a command to run: (diff, build, apply, delete)"
  ;;
esac

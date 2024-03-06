#!/usr/bin/env bash

set -o errexit
set -o pipefail

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

function kustomizeIt {
  clusterDomain="$2" kubectl kustomize \
    --enable-helm \
    --helm-command helm \
    "$__DIR/$1"
}

function build {
  kustomizeIt "$1" "$2"
}

function delete {
  kustomizeIt "$1" | kubectl delete -f -
}

function apply {
  kustomizeIt "$1" "$2" | kubectl apply -f -
}

COMMAND=$1
OVERLAY=overlays/$2
DOMAIN=$3

case "$COMMAND" in
  diff) diff <(kustomizeIt base) <(kustomizeIt "$OVERLAY") | more
  ;;
  build) build "$OVERLAY" "$DOMAIN"
  ;;
  apply) apply "$OVERLAY" "$DOMAIN"
  ;;
  delete) delete "$OVERLAY"
  ;;
  *) echo "Please specify a command: (diff, build, apply, delete)"
  ;;
esac

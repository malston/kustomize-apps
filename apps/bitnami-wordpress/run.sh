#!/usr/bin/env bash

set -o errexit
# set -o nounset
set -o pipefail

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

function kustomizeIt {
  clusterDomain="$2" kubectl kustomize \
    --enable-helm \
    --helm-command helm \
    "$__DIR/$1"
}

COMMAND=$1
OVERLAY=$2
DOMAIN=$3

set -x
case "$COMMAND" in
  diff) diff <(kustomizeIt base) <(kustomizeIt "$OVERLAY") | more
  ;;
  delete|destroy|uninstall) kustomizeIt "$OVERLAY" | kubectl delete -f -
  ;;
  apply|build) kustomizeIt "$OVERLAY" "$DOMAIN" | kubectl apply -f -
  ;;
  *) kustomizeIt base "$DOMAIN" | kubectl apply -f -
  ;;
esac

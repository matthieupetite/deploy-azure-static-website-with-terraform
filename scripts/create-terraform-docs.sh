#!/bin/sh
INFRA_REPO="infra"

if [ -d "$INFRA_REPO" ] && terraform-docs markdown table -c .terraform-docs.yaml  $INFRA_REPO > "$INFRA_REPO/README.md"; then
  mdformat "$INFRA_REPO/README.md"
  git add "$INFRA_REPO/README.md"
fi

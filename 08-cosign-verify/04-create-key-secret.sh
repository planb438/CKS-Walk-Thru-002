#!/bin/bash
kubectl create ns cosign-verify 2>/dev/null || true

kubectl create secret generic cosign-pubkey \
  --from-file=cosign.pub \
  -n cosign-verify

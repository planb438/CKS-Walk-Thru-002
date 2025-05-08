kubectl create ns cosign-lab || true
kubectl create secret generic cosign-pubkey \
  --from-file=cosign.pub \
  -n cosign-lab

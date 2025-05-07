#!/bin/bash
export COSIGN_PASSWORD=""
cosign sign --key cosign.key docker.io/chris438/node-k8s-app:latest
# Verify the signature
cosign verify --key cosign.pub docker.io/chris438/node-k8s-app:latest

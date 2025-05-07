#!/bin/bash
export COSIGN_PASSWORD=""
cosign sign --key cosign.key docker.io/YOUR_DOCKERHUB/cks-demo:1.0

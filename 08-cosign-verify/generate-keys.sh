#!/bin/bash
# This script generates a key pair for signing images with Cosign.cosign.key (private), cosign.pub (public)


# It uses the Cosign CLI to generate the keys and stores them in the current directory.
# Make sure you have Cosign installed and in your PATH.
  
export COSIGN_PASSWORD=""
cosign generate-key-pair

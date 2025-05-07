#!/bin/bash

echo "[+] Installing OPA Gatekeeper"
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.15/deploy/gatekeeper.yaml

echo "[+] Waiting for pods..."
kubectl wait --for=condition=Available -n gatekeeper-system deployment/gatekeeper-controller --timeout=60s

echo "[+] Applying ConstraintTemplate"
kubectl apply -f privileged-container-template.yaml

echo "[+] Applying Constraint"
kubectl apply -f privileged-container-constraint.yaml

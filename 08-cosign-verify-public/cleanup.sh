#!/bin/bash
kubectl delete -f kyverno-verify-policy.yaml
kubectl delete pod signed unsigned --ignore-not-found

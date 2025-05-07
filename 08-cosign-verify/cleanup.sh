#!/bin/bash
kubectl delete ns cosign-verify
helm uninstall kyverno -n kyverno
kubectl delete ns kyverno

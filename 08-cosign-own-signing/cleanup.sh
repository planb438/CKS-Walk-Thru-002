#!/bin/bash
# This script is used to clean up the environment after running the demo
# It removes the cosign key, the cosign image, and the Kyverno namespace
kubectl delete ns cosign-lab kyverno
helm uninstall kyverno -n kyverno
kubectl delete clusterpolicy require-signed-images --ignore-not-found

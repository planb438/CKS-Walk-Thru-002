🔐 Scenario 8 (Standalone): Image Signing with Cosign + Kyverno verifyImages
📘 Overview
This lab ensures only signed container images are admitted to the cluster using:

Cosign for image signing

Kyverno for policy enforcement via verifyImages

📁 Structure
bash
Copy
Edit
cks-labs/
└── 08-cosign-verify/
    ├── install-kyverno.sh
    ├── install-cosign.sh
    ├── generate-keys.sh
    ├── cosign-sign.sh
    ├── verify-policy.yaml
    ├── signed-pod.yaml
    ├── unsigned-pod.yaml
    ├── cleanup.sh
    └── README.md

    ---

    🚀 Run Test
bash
Copy
Edit
kubectl apply -f verify-policy.yaml

kubectl apply -f signed-pod.yaml    # ✅ Should succeed
kubectl apply -f unsigned-pod.yaml  # ❌ Should fail
🧹 cleanup.sh
bash
Copy
Edit
#!/bin/bash
kubectl delete -f verify-policy.yaml
kubectl delete pod signed-app unsigned-app --ignore-not-found
helm uninstall kyverno -n kyverno
kubectl delete ns kyverno
📘 README.md Excerpt
markdown
Copy
Edit
# Scenario 8 – Image Signing with Cosign + Kyverno

## Goal
Only allow signed container images using Kyverno's `verifyImages` admission control.

## Prerequisites
- Kubernetes cluster
- Docker Hub access
- `kubectl` + `helm`
- `cosign` installed (via `install-cosign.sh`)

## Steps
1. Install Kyverno (`install-kyverno.sh`)
2. Install Cosign and generate keys (`install-cosign.sh`, `generate-keys.sh`)
3. Sign your image (`cosign-sign.sh`)
4. Apply policy (`verify-policy.yaml`)
5. Test signed vs unsigned pods

## Test
```bash
kubectl apply -f signed-pod.yaml     # ✅
kubectl apply -f unsigned-pod.yaml   # ❌
CKS Tips
Use verifyImages to lock down image provenance

Embed public keys for static validation

Kyverno can mutate image to pinned digest (mutateDigest: true)

yaml
Copy
Edit

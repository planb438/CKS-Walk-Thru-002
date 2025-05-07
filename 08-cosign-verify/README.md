🔐 Scenario 8 (Standalone): Image Signing with Cosign + Kyverno verifyImages
📘 Overview
This lab ensures only signed container images are admitted to the cluster using:

Cosign for image signing

Kyverno for policy enforcement via verifyImages

---

📁 Directory Structure
bash
Copy
Edit
cks-labs/
└── 08-cosign-verify/
    ├── 00-namespace.yaml
    ├── 01-install-kyverno.sh
    ├── 02-install-cosign.sh
    ├── 03-generate-keys.sh
    ├── 04-create-key-secret.sh
    ├── 05-cosign-sign.sh
    ├── 06-verify-policy.yaml
    ├── 07-signed-pod.yaml
    ├── 08-unsigned-pod.yaml
    ├── cleanup.sh
    └── README.md

    ---

    📘 Updated README.md Excerpt
markdown
Copy
Edit
# 🔐 Scenario 8 – Cosign + Kyverno with Secret-based Public Key

## 🎯 Goal
Block unsigned images using Kyverno’s `verifyImages` rule, referencing a public key from a Kubernetes Secret.

## ✅ Steps
1. Create namespace (`cosign-verify`)
2. Generate key pair (`03-generate-keys.sh`)
3. Sign image with Cosign (`05-cosign-sign.sh`)
4. Create Secret for public key (`04-create-key-secret.sh`)
5. Apply Kyverno policy (`06-verify-policy.yaml`)
6. Test pods in `cosign-verify` namespace

## 🧪 Test
```bash
kubectl apply -f 07-signed-pod.yaml     # ✅ Allowed
kubectl apply -f 08-unsigned-pod.yaml   # ❌ Denied

---

💡 CKS Tip
Using a keyRef from a Secret is preferred over embedding the key in YAML

Ensure the namespace is correct or Kyverno will not find the secret


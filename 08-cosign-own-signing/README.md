🔐 Scenario 8 (Revised): Sign Your Own Image with Cosign + Kyverno verifyImages (Secret-based)
🎯 Objectives
Generate Cosign key pair

Build and push an image to Docker Hub via Podman

Sign the image with Cosign

Store the public key as a Kubernetes Secret

Create a Kyverno policy that validates image signatures using that key

Test:

✅ Signed image pod → allowed

❌ Unsigned image pod → blocked

📁 Structure
bash
Copy
Edit
cks-labs/
└── 08-cosign-own-signing/
    ├── 00-create-namespace.yaml
    ├── 01-install-kyverno.sh
    ├── 02-install-cosign.sh
    ├── 03-generate-keys.sh
    ├── 04-build-push-podman.sh
    ├── 05-cosign-sign.sh
    ├── 06-create-key-secret.sh
    ├── 07-verify-policy.yaml
    ├── 08-signed-pod.yaml
    ├── 09-unsigned-pod.yaml
    ├── cleanup.sh
    └── README.md

    ---

    📘 README.md (Summary)
markdown
Copy
Edit
# 🔐 Scenario 8: Sign and Enforce Your Own Image with Cosign + Kyverno

## 🎯 What You Do
- Build and push your own image
- Sign it with Cosign
- Enforce signature validation via Kyverno

## 🧪 Test
```bash
kubectl apply -f 07-verify-policy.yaml
kubectl apply -f 08-signed-pod.yaml   # ✅ Allowed
kubectl apply -f 09-unsigned-pod.yaml # ❌ Blocked
💡 CKS Tips
Use keyRef + Secret to safely store public keys

mutateDigest: true ensures digest-pinned deployments

Don’t forget: Kyverno and the public key must be in place before testing
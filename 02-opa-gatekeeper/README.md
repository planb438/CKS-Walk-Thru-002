🧠 Scenario 2: Block Privileged Pods Using OPA Gatekeeper (Rego-Based)
---

📘 Real-World Context

-

Your organization uses OPA Gatekeeper to enforce Kubernetes policies across teams. You want to block pods running with privileged: true, similar to the Kyverno rule — but using Rego and CRDs.

-

🎯 Objectives
Install OPA Gatekeeper via official manifests

-
Apply a ConstraintTemplate (defines the Rego logic)

Apply a Constraint (applies the logic to pod resources)

Test it with a violating pod

See how Rego policies work in a real admission controller

-

📁 Files:
bash
Copy
Edit
cks-labs/
└── 02-opa-gatekeeper/
    ├── install-gatekeeper.sh
    ├── privileged-container-template.yaml
    ├── privileged-container-constraint.yaml
    ├── test-bad-pod.yaml
    └── README.md

---


✅ Verification
-
kubectl apply -f test-bad-pod.yaml

-
Expected output:
-
Error from server: admission webhook \"...\" denied the request: Privileged containers are not allowed

---

📘 README.md Summary

# 🚫 OPA Gatekeeper: Block Privileged Pods

This lab installs OPA Gatekeeper and uses a Rego-based policy to block pods using privileged mode.

## ✅ What You Do
---

- Install Gatekeeper using official manifests
- Define a `ConstraintTemplate` using Rego
- Apply a `Constraint` to match pod resources

- Test with a violating pod
---

## 🤔 Why This Matters

---
  OPA Gatekeeper is heavily used in enterprises
  -
  Rego policies allow advanced logic and auditing
  -
  CKS often includes admission control tasks
  
---
## 🔍 Test
```bash
kubectl apply -f test-bad-pod.yaml
Should be rejected by webhook: "Privileged containers are not allowed"

🔄 Cleanup
bash
Copy
Edit
kubectl delete -f privileged-container-constraint.yaml
kubectl delete -f privileged-container-template.yaml
kubectl delete -f test-bad-pod.yaml
kubectl delete ns gatekeeper-system













    

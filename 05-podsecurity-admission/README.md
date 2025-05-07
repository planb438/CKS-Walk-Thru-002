# 🔐 PodSecurity Admission: Restricted Profile

## 🧠 What This Is
PodSecurity Admission (PSA) is a built-in controller that enforces security best practices for pods using namespace labels.

## ✅ Goal
Block insecure pods in a namespace by labeling it with `restricted` mode.

## 🧪 Test
```bash
kubectl apply -f ns-restricted.yaml
kubectl apply -f bad-pod.yaml    # ❌ should be rejected
kubectl apply -f good-pod.yaml   # ✅ should be allowed

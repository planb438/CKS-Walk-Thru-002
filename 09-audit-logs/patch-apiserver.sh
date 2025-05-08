#!/bin/bash
echo "[+] Placing audit policy at /etc/kubernetes/"
sudo cp audit-policy.yaml /etc/kubernetes/

echo "[+] Patching kube-apiserver manifest"
sudo sed -i '/--secure-port=6443/a \    - --audit-policy-file=/etc/kubernetes/audit-policy.yaml\n    - --audit-log-path=/var/log/kubernetes/audit.log' /etc/kubernetes/manifests/kube-apiserver.yaml

echo "[+] kube-apiserver will restart via static pod automatically"

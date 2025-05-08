#!/bin/bash
echo "[+] Falco alerts in last 30s (if any):"
kubectl logs -n falco -l app=falco --since=30s

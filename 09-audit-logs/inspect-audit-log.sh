#!/bin/bash
echo "[+] Searching for secret access in audit log"
sudo grep test-audit /var/log/kubernetes/audit.log | jq .

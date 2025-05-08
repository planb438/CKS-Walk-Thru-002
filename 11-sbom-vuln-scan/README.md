🧰 Scenario 12: SBOM & Vulnerability Scanning with Syft + Grype
📘 Real-World Context
Modern DevSecOps workflows require knowing what’s inside your container images. You can generate an SBOM (Software Bill of Materials) and scan it for known CVEs using:

Syft: generates SBOMs (JSON, SPDX, CycloneDX)

Grype: scans SBOMs or images for vulnerabilities

🎯 Objectives
Install Syft & Grype locally

Pull or build a test image

Generate an SBOM using Syft

Scan the image (or SBOM) with Grype

Interpret output and map to CKS use cases

📁 Structure
bash
Copy
Edit
cks-labs/
└── 12-sbom-vuln-scan/
    ├── 00-install-syft-grype.sh
    ├── 01-sbom-generate.sh
    ├── 02-grype-scan.sh
    ├── 03-demo-image.Dockerfile
    ├── README.md



---

🐳 03-demo-image.Dockerfile
Dockerfile
Copy
Edit
FROM python:3.8-slim
RUN pip install flask
Build with:

bash
Copy
Edit
podman build -t local/sbom-demo:1.0 -f 03-demo-image.Dockerfile

---

📘 README.md Summary
markdown
Copy
Edit
# 🧰 Scenario 12 – SBOM + Vulnerability Scanning

## 🎯 Goal
Generate a Software Bill of Materials (SBOM) and scan for known vulnerabilities.

## 🛠 Tools
- **Syft** = generate SBOM
- **Grype** = scan image or SBOM

## 🧪 Test Flow
```bash
./00-install-syft-grype.sh
podman build -t local/sbom-demo:1.0 -f 03-demo-image.Dockerfile
./01-sbom-generate.sh
./02-grype-scan.sh
✅ CKS Tips
SBOM generation is increasingly required in compliance-focused orgs

Combine Grype output with CI/CD admission rules (e.g. deny HIGH severity)

SBOMs can be exported as SPDX or CycloneDX and attached to image metadata
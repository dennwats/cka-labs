#!/bin/bash

echo "🚀 Setting up RHCA: OpenShift Journey structure..."

# Week map for each certification
declare -A weeks=(
  ["ckad"]="week-0"
  ["cka"]="week-1-cluster-install week-2-storage-scheduling week-3-networking-troubleshooting"
  ["rhce"]="week-4-roles-tasks week-5-automation-projects week-6-final-review"
  ["ex280"]="week-7-apps-routes week-8-helm-s2i"
  ["ex480"]="week-9-gitops-ci"
  ["stig"]="week-10-stig-hardening"
  ["logging"]="week-11-monitoring-logging"
  ["capstone"]="week-12-capstone"
)

# Core folders
core_folders=("scripts" "zett" "social" ".github/workflows")

# Create core folders
for folder in "${core_folders[@]}"; do
  mkdir -p "$folder"
done

# Create weekly lab folders and README stubs
for cert in "${!weeks[@]}"; do
  mkdir -p "$cert"
  for week in ${weeks[$cert]}; do
    week_path="$cert/$week"
    mkdir -p "$week_path"
    cat <<EOF > "$week_path/README.md"
# ${week//-/ }

## Objective
- [ ] Define lab goals here for $cert

## Steps
1. Add step-by-step lab tasks here.

## Retype + Tweak Challenge
- Describe how you’ll retype or modify commands or YAML.

## Zettelkasten Link
- [ ] Link to related zett note.

## GitHub Actions / CI
- [ ] Lint YAML or validate configs
EOF
  done
done

# Create roadmap.md with your official 12-week timeline
cat <<EOF > roadmap.md
# RHCA: OpenShift Mastery Roadmap (12 Weeks)

| Week | Focus | Modules | Notes |
|------|-------|---------|-------|
| 0 | ✅ CKAD Review – Deployment, Services, ConfigMaps | CKAD weak areas | Complete |
| 1 | CKA Cluster Install (kubeadm, HA, etcd) | CKA Module 1 | Starts April 7 |
| 2 | CKA Storage + Workloads | CKA Modules 2 + 4 | Persistent Volumes, Scheduling |
| 3 | CKA Networking + Troubleshooting | CKA Modules 3 + 5 | DNS, Ingress, Debug |
| 4 | RHCE Linux Rehash (roles, tasks, handlers) | RHCE Modules 1–3 | SELinux, Systemd |
| 5 | RHCE Projects + System Automation | RHCE Modules 4–6 | Ansible Playbooks |
| 6 | RHCE Final + Start EX280 Setup | RHCE Modules 7–10 | Begin OpenShift Prep |
| 7 | OpenShift Apps, Routes, Image Streams | EX280 Modules 2–3 | OCP Deployments |
| 8 | Helm, Operators, Source-to-Image (S2I) | EX280 Module 4 | Automation Tools |
| 9 | GitOps + CI/CD + Pipelines | EX480, Pipelines | ArgoCD, Tekton |
|10 | STIG + Compliance Hardening | RHSA + OpenShift | SecurityContext, SCC |
|11 | OpenShift Monitoring + Logging | Custom Ops Lab | EFK, Alerts |
|12 | Milestone Project + GitHub Showcase | Capstone | Final Demo Project |
EOF

# Create .github workflow for YAML validation
cat <<EOF > .github/workflows/validate-yaml.yml
name: YAML Lint
on:
  push:
    paths:
      - '**/*.yaml'
      - '**/*.yml'
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Install yamllint
        run: pip install yamllint
      - name: Run yamllint
        run: yamllint .
EOF

echo "✅ All folders and files created successfully."


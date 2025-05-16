# GitOps with ArgoCD

This project demonstrates a complete GitOps workflow using:
- ArgoCD for continuous deployment
- Jenkins for CI
- Terraform for infrastructure provisioning
- Ansible for configuration management
- Kubernetes for container orchestration
- Docker for packaging the application

## Deployment Steps
1. Build and push Docker image using Jenkins.
2. Jenkins applies Kubernetes manifests.
3. ArgoCD continuously syncs the manifests from GitHub to Kubernetes.

## ArgoCD Setup
- Install ArgoCD on Kubernetes
- Apply `argocd/app.yaml`

## Useful Commands
```bash
kubectl apply -f argocd/app.yaml

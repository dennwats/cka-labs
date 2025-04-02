# 🧪 CKA Lab: Deployment + Service

## 🎯 Objective
Deploy a simple NGINX app with a matching service in Kubernetes using `kubectl`.

## 📂 Files
- `deployment.yaml` – Defines the nginx deployment
- `service.yaml` – Exposes it on a ClusterIP

## 🚀 Steps Taken
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get pods
kubectl get svc
```

## ✅ Outcome
- NGINX app deployed
- Service reachable via ClusterIP

## 📸 Screenshots
- ✅ `kubectl get pods` output
- ✅ `kubectl get svc`
- ✅ Terminal YAML apply
- ✅ Browser output (if port-forwarded)

## 🧠 Lessons Learned
- Used `kubectl --dry-run=client -o yaml` to generate files
- Understood how Services expose Deployments

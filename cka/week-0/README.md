# 🧪 Week 0 – CKAD Prep: Configs, Services, Deployment

## ✅ Focus Areas
- Practice ConfigMaps and Secrets injection
- Review Deployment YAML with probes
- Expose app with ClusterIP + curl from debug pod

---

## 🛠️ Files Included
| File | Purpose |
|------|---------|
| `deployment.yaml` | Basic app with probes + env from ConfigMap |
| `scripts/configmap-gen.py` | Python CLI tool to generate configmap YAML |
| `screenshots/week-0/` | Visuals for service test, describe pod, etc. |

---

## 📝 Notes
- All YAML edited with `vim`
- Config tested with `kubectl exec` + `curl`
- Debug pod: `kubectl run -it --rm curl --image=radial/busyboxplus:curl`


kubectl apply -f rbac.yaml
kubectl apply -f deployment.yaml
kubectl apply -f storageclass.yaml
kubectl apply -f grafana-pvc.yaml
kubectl apply -f grafana-deployment.yaml
kubectl apply -f prometheus-prometheus.yaml

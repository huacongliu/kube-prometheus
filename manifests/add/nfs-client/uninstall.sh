kubectl delete -f rbac.yaml
kubectl delete -f deployment.yaml
kubectl delete -f storageclass.yaml
kubectl delete -f grafana-pvc.yaml
kubectl patch pvc grafana -p '{"metadata":{"finalizers":null}}'

sleep 2
echo ----------------------------
kubectl get pod -n monitoring

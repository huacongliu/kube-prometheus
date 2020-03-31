kubectl delete -f .
kubectl patch pvc grafana -p '{"metadata":{"finalizers":null}}' -n monitoring
kubectl get sc,pv,pvc -n monitoring

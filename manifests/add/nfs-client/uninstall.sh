kubectl delete -f rbac.yaml
kubectl delete -f deployment.yaml
kubectl delete -f grafana-deployment.yaml
kubectl delete -f prometheus-prometheus.yaml
kubectl delete pvc prometheus-k8s-db-prometheus-k8s-0 -n monitoring 
kubectl delete pvc prometheus-k8s-db-prometheus-k8s-1 -n monitoring 
kubectl delete pvc grafana -n monitoring 

sleep 2
echo ----------------------------
kubectl get pvc -n monitoring
echo ------pvc-------------------
kubectl get pod -n monitoring


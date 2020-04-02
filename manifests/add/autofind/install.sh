kubectl delete secret additional-configs -n monitoring >/dev/null 2>&1
kubectl create secret generic additional-configs --from-file=prometheus-additional.yaml -n monitoring
kubectl apply -f prometheus-clusterRole.yaml

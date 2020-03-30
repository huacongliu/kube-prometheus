kubectl create secret generic additional-configs --from-file=prometheus-additional.yaml -n monitoring
kubectl apply -f prometheus-clusterRole.yaml

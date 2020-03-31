kubectl apply -f prometheus-webhook-dingtalk-config.yaml
kubectl apply -f dingtalk-hook.yaml
kubectl delete secret alertmanager-main -n monitoring
kubectl create secret generic alertmanager-main --from-file=alertmanager.yaml -n monitoring

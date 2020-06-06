#kubectl delete -f dingtalk-config.yaml
#kubectl apply -f dingtalk-config.yaml
kubectl delete configmap dingding -n monitoring >/dev/null 2>&1
kubectl create configmap dingding --from-file=dingtalk.tmpl -n monitoring
kubectl delete -f dingtalk-hook.yaml
kubectl apply -f dingtalk-hook.yaml

kubectl delete secret alertmanager-main -n monitoring
kubectl create secret generic alertmanager-main --from-file=alertmanager.yaml -n monitoring
echo "wait dingtalk pod start ..."
sleep 15 
kubectl logs -f `kubectl get pod -n monitoring |grep dingtalk |awk '{print $1}'` -n monitoring

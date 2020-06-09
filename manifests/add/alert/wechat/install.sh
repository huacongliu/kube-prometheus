#kubectl delete configmap wechat  -n monitoring
#kubectl create configmap wechat --from-file=wechat.tmpl -n monitoring

kubectl delete secret alertmanager-main -n monitoring
kubectl create secret generic alertmanager-main --from-file=alertmanager.yaml  --from-file=wechat.tmpl  -n monitoring

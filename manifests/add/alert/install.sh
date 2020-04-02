kubectl delete configmap wechat  -n monitoring
kubectl create configmap wechat --from-file=wechat.tmpl -n monitoring
kubectl delete -f prometheus-webhook-dingtalk-config.yaml
kubectl apply -f prometheus-webhook-dingtalk-config.yaml
kubectl delete -f dingtalk-hook.yaml
kubectl apply -f dingtalk-hook.yaml

kubectl delete secret alertmanager-main -n monitoring
kubectl create secret generic alertmanager-main --from-file=alertmanager.yaml  --from-file=wechat.tmpl  -n monitoring
###如果修改了wechat.tmpl模板，需要执行下面的语句
#kubectl delete -f alertmanager-alertmanager.yaml 
#kubectl apply -f alertmanager-alertmanager.yaml 

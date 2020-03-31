kubectl apply -f controller/prometheus-kubeControllermanagerService.yaml
kubectl apply -f scheduler/prometheus-kubeSchedulerService.yaml
sed -i 's#bind-address=127.0.0.1#bind-address=0.0.0.0#g' /etc/kubernetes/manifests/kube-scheduler.yaml 
sed -i 's#bind-address=127.0.0.1#bind-address=0.0.0.0#g' /etc/kubernetes/manifests/kube-controller-manager.yaml 
#echo "kube-scheduler.yaml"
#cat /etc/kubernetes/manifests/kube-scheduler.yaml |grep bind-address
#echo "kube-controller-manager.yaml"
#cat /etc/kubernetes/manifests/kube-controller-manager.yaml |grep bind-address

echo "kube-etcd"
kubectl delete secret etcd-certs -n monitoring >/dev/null 2>&1
kubectl -n monitoring create secret generic etcd-certs --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.crt --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.key --from-file=/etc/kubernetes/pki/etcd/ca.crt
kubectl delete pod prometheus-k8s-0 -n monitoring
kubectl delete pod prometheus-k8s-1 -n monitoring
kubectl apply -f nfs-client/prometheus-prometheus.yaml
kubectl apply -f etcd/prometheus-serviceMonitorEtcd.yaml
kubectl apply -f etcd/prometheus-etcdService.yaml
kubectl apply -f etcd/prometheus-etcdRules.yaml

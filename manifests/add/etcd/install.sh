kubectl delete secret etcd-certs -n monitoring
kubectl -n monitoring create secret generic etcd-certs --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.crt --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.key --from-file=/etc/kubernetes/pki/etcd/ca.crt
kubectl delete pod prometheus-k8s-0 -n monitoring
kubectl delete pod prometheus-k8s-1 -n monitoring
kubectl apply -f ../nfs-client/prometheus-prometheus.yaml
kubectl apply -f prometheus-serviceMonitorEtcd.yaml
kubectl apply -f prometheus-etcdService.yaml
kubectl apply -f prometheus-etcdRules.yaml

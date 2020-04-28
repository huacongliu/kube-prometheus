kubectl delete -f pod.yaml
kubectl delete -f pvc.yaml
kubectl delete -f storagreclass.yaml
kubectl delete secret ceph-secret --namespace=default
kubectl delete secret ceph-admin-secret --namespace=default 

###删除pod
kubectl delete -f pod.yaml

###删除pvc
kubectl delete -f pvc.yaml

###删除sc
kubectl delete -f storageclass.yaml

###
NAMESPACE=default
kubectl delete secret ceph-secret-admin -n $NAMESPACE

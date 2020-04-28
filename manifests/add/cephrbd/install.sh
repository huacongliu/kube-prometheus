###创建ceph osd pool
ceph osd pool create kube 8 8
ceph auth add client.kube mon 'allow r' osd 'allow rwx pool=kube'


#Install with RBAC roles
NAMESPACE=default # change this if you want to deploy it in another namespace
sed -r -i "s/namespace: [^ ]+/namespace: $NAMESPACE/g" ./rbac/*.yaml
sed -r -i "N;s/(name: PROVISIONER_SECRET_NAMESPACE.*\n[[:space:]]*)value:.*/\1value: $NAMESPACE/" ./rbac/deployment.yaml
kubectl -n $NAMESPACE apply -f ./rbac


##创建 admin secret
ceph auth get client.admin 2>&1 |grep "key = " |awk '{print  $3'} |xargs echo -n > /tmp/key
kubectl create secret generic ceph-admin-secret --from-file=/tmp/key --namespace=default  --type=kubernetes.io/rbd

###创建 用户secret 
ceph auth get-key client.kube > /tmp/key
kubectl create secret generic ceph-secret --from-file=/tmp/key --namespace=default   --type=kubernetes.io/rbd

###创建sc测试
kubectl apply -f storagreclass.kube.yaml

###创建pvc测试
kubectl apply -f pvc.yaml

###创建pod测试
kubectl apply -f pod.yaml

###查看pvc
kubectl get pvc

###查看pod
sleep 5
kubectl get pod

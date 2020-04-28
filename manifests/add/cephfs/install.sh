###Install with RBAC roles
NAMESPACE=default # change this if you want to deploy it in another namespace
sed -r -i "s/namespace: [^ ]+/namespace: $NAMESPACE/g" ./rbac/*.yaml
sed -r -i "N;s/(name: PROVISIONER_SECRET_NAMESPACE.*\n[[:space:]]*)value:.*/\1value: $NAMESPACE/" ./rbac/deployment.yaml
kubectl -n $NAMESPACE apply -f ./rbac

###Create a Ceph admin secret
ceph auth get-key client.admin > /tmp/secret
kubectl create secret generic ceph-secret-admin --from-file=/tmp/secret --namespace=$NAMESPACE

###创建sc
kubectl create -f storageclass.yaml

###创建pvc
kubectl apply -f pvc.yaml

###创建pod
kubectl apply -f pod.yaml

###查看pvc
sleep 3
kubectl get pvc

sleep 2
kubectl describe pvc claim1-cephfs

sleep 3
###查看pod
kubectl get pod 

kubectl apply -f storageclass.yaml
#kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml 
kubectl get sc,pv,pvc -n monitoring
echo 
echo 
echo -------------------------------------
kubectl describe pvc grafana -n monitoring

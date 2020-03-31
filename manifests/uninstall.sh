kubectl delete --ignore-not-found=true -f ./ -f setup
echo "正在卸载，请等待 "
kubectl get pod -n monitoring |grep prometheus-operator >/dev/null 2>&1
if [ $? -ne 0 ];then
    echo "prometheus-operator卸载成功！"
fi

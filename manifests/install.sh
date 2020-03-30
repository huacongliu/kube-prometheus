#git clone https://github.com/chinaboy007/kube-prometheus
#cd kube-prometheus
echo "1.start load image"
cd add/images
sh image-load.sh --images-path images-2020-03-20
cd ../..


###开始安装kube-prometheus
echo ""
echo "2.start install kube-prometheus"
kubectl create -f setup >/dev/null 2>&1 
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f ./ >/dev/null 2>&1

###配置kube-controller kube-scheduler等监控
cd add
echo ""
echo "3.config kube-controller kube-scheduler servicemonitor"
sh change.sh
#echo "installing,please wait 2  minutes"
#sleep 120
cd ..

###安装etcd servicemonitor
cd etcd
echo ""
echo "4.config etcd servicemonitor"
sh install.sh
cd ..


###启用nfs存储
echo "5.启用nfs存储"
cd nfs-client
sh install.sh
cd ..



###配置自动发现
echo "6.配置自动发现"
cd autofind
sh install.sh
cd ..



###为grafana prometheus alert-manager服务配置NodePort
echo ""
echo "7.config nodeport for grafana prometheus alert-manager ..."
sh nodeport.sh
echo ""

###grafana prometheus alert-manager服务配置nginx-ingress
echo "8.config ingress for grafana prometheus alert-manager ..."
kubectl get pod |grep ingress >/dev/null 2>&1
if [ $? -eq 0 ];then
   namespace=default
else
   namespace=nginx-ingress
fi
loadbalance_port=`kubectl get svc -n $namespace |grep LoadBalancer |awk '{print $5}'|awk -F'/' '{print $1}' |awk -F':' '{print $2}'`
kubectl apply -f ingress-monitor.yaml
echo "---------------------------------------------------"
kubectl get pod,svc -n monitoring
echo "install successful!check..."
echo "***************************************************"
echo "you can access dashboard for NodePort"
echo "grafana       NodePoert:30000"
echo "prometheus    NodePoert:30090"
echo "alert-manager NodePoert:30093"
echo
echo "***************************************************"
echo "you can access dashboard for nginx-ingress"
echo "grafana       http://grafana.k8s.com:$loadbalance_port"
echo "prometheus    http://prome.k8s.com:$loadbalance_port"
echo "alert-manager http://alert.k8s.com:$loadbalance_port"

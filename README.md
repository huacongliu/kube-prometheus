#kube-prometheus

主要功能：

1.支持数据持久化
2.支持kube-controller监控
3.支持kube-scheduse监控
4.支持kube-etcd监控
5.支持NodePort访问
6.支持ingress访问
7.支持离线安装
8.支持重复安装
9.支持卸载




#开始安装：

git https://github.com/chinaboy007/kube-prometheus.git
cd kube-prometheus/manifests
sh install.sh



启用nfs-client数据持久化  

cd kube-prometheus/manifests/add  
sh storage.sh



一键卸载  

cd kube-prometheus/manifests
sh uninstall.sh

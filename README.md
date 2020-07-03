# kube-prometheus

## 概述

**很多地方提到Prometheus Operator是kubernetes集群监控的终极解决方案，但是目前Prometheus Operator已经不包含完整功能，完整的解决方案已经变为kube-prometheus。项目地址为：https://github.com/coreos/kube-prometheus
本项目基于最新kube-prometheus开发,解决了kube-prometheus安装部署后无法监控kube-controller kube-scheduse kube-etcd，无法告警、无法数据持久化等各种问题，为小白用户提供了极大便利。**
   
   
## 主要功能

- 1.支持数据持久化

- 2.支持kube-controller监控

- 3.支持kube-scheduse监控

- 4.支持kube-etcd监控

- 5.支持NodePort访问

- 6.支持ingress访问

- 7.支持离线安装

- 8.支持重复安装

- 9.支持一键卸载


## 部署在 Kubernetes
#### 前置要求
   
 - 支持kubeadm方式安装的k8s,二进制方式安装的未测试
 - 支持prometheus 2.15.2版本

#### 一键安装

```bash 
git clone https://github.com/chinaboy007/kube-prometheus.git
cd kube-prometheus/manifests
sh install.sh
```


#### 一键卸载

```bash
cd kube-prometheus/manifests
sh uninstall.sh
```

#### 数据持久化

###### 启用nfs-client-provisioner动态存储,并配置prometheus granafa数据持久化
```bash
cd kube-prometheus/manifests/add/nfs-client
sh install.sh
```
#### 版本升级

###### 如果之前已安装过kube-prometheus，如果想升级到2.17.2，请执行如下命令

##### 1.查看当前版本
```bash
kubectl describe pod  prometheus-k8s-0 -n monitoring |grep prometheus:v |awk -F: '{print $3}'
```

#### 2.升级到2.17.2
```bash
cd kube-prometheus/manifests/add/upgrade
sh upgrade.sh
```
## 告警配置

#### 只开启业微信告警,支持自定义模板
```bash
cd kube-prometheus/manifests/add/alert/wechat
sh install.sh
```

#### 只开启钉钉告警,支持自定义模板
##### 告警采用开源项目https://github.com/timonwong/prometheus-webhook-dingtalk 实现
```bash
cd kube-prometheus/manifests/add/alert/dingtalk
sh install.sh
```

#### 同时开启企业微信、钉钉告警
###### 告警采用开源项目https://github.com/feiyu563/PrometheusAlert 实现
```bash
cd kube-prometheus/manifests/add/prometheusalert
先编辑conf.txt,填入相应的key或token，
再执行sh install.sh
```


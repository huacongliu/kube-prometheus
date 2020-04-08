# kube-prometheus

## 概述

**本项目基于最新https://github.com/coreos/kube-prometheus开发**

支持prometheus 2.15.2版本

支持kubeadm方式安装的k8s,二进制方式安装的未测试


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




## 开始安装

```bash 
git clone https://github.com/chinaboy007/kube-prometheus.git
cd kube-prometheus/manifests
sh install.sh```


## 一键卸载

```bash
cd kube-prometheus/manifests
sh uninstall.sh```

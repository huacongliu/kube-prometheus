#!/bin/bash
echo "开始升级到2.17.2"
kubectl delete -f prometheus-prometheus.yaml
kubectl apply  -f prometheus-prometheus.yaml

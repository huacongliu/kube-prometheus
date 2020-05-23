#!/bin/bash
echo "查看当前alertmanager.yaml配置"
echo `kubectl get secret alertmanager-main -n monitoring -o yaml |grep alertmanager.yaml |awk -F: '{print $NF}'` |base64 -d
echo 
sleep 3
kubectl get pod -n monitoring |grep prometheus-alert-center
kubectl get pod -n monitoring |grep alertmanager-main
sleep 3
kubectl logs -f alertmanager-main-0 -c alertmanager -n monitoring

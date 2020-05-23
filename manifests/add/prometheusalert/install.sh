#!/bin/bash
echo "install PrometheusAlert-Deployment.yaml"
kubectl apply -f PrometheusAlert-Deployment.yaml -n monitoring
kubectl delete secret alertmanager-main -n monitoring
kubectl create secret generic alertmanager-main -n monitoring --from-file=alertmanager.yaml

sh check.sh

#!/bin/bash
echo "install PrometheusAlert-Deployment.yaml"

modify() {
WX_KEY=`cat conf.txt |grep wx_key |awk -F= '{print $2}'`
DD_TOKEN=`cat conf.txt |grep dd_token |awk -F= '{print $2}'`
echo WX_KEY=$WX_KEY
echo DD_TOKEN=$DD_TOKEN
cp alertmanager.yaml.temp alertmanager.yaml
cp PrometheusAlert-Deployment.yaml.temp PrometheusAlert-Deployment.yaml
sed -i "s/WX_KEY/${WX_KEY}/g" alertmanager.yaml PrometheusAlert-Deployment.yaml
sed -i "s/DD_TOKEN/${DD_TOKEN}/g" alertmanager.yaml PrometheusAlert-Deployment.yaml
}

change() {
kubectl apply -f PrometheusAlert-Deployment.yaml -n monitoring
kubectl delete secret alertmanager-main -n monitoring
kubectl create secret generic alertmanager-main -n monitoring --from-file=alertmanager.yaml
}




modify
change
sh check.sh

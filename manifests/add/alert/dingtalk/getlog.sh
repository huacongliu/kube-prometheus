#!/bin/bash
kubectl logs -f `kubectl get pod -n monitoring |grep dingtalk |awk '{print $1}'` -n monitoring

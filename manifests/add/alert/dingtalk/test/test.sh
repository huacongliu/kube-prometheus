#!/bin/bash

if [ $# -ne 1 ];then
   echo "Usage: $0 [DD_TOKEN]"
   echo "eg: $0 cee80c5dfff988b20ec626f54ac2fd099dfd9c227e1cfea778b1dfffa1025acc"
   exit 1
fi

token=$1
echo $token


curl 'https://oapi.dingtalk.com/robot/send?access_token='$token'' \
   -H 'Content-Type: application/json' \
   -d '{"msgtype": "text","text": {"content": {"title":"prometheus","content":"测试ok"}}}'


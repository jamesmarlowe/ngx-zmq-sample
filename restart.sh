#!/bin/bash

clear

echo "moving to `pwd`"
echo "stopping nginx"
sudo /usr/local/openresty/nginx/sbin/nginx -s stop -p `pwd`
sudo killall nginx

echo "removing nginx logs"
sudo rm logs/*.log

echo "starting nginx from conf/nginx$1.conf"
sudo /usr/local/openresty/nginx/sbin/nginx -c conf/nginx$1.conf -p `pwd`

echo "calling health-check"
curl localhost/health/

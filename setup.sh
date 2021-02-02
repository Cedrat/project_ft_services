#!/bin/bash
sudo apt-get install conntrack
minikube start --vm-driver=none
sed -i  "s/x.x.x.x/$(sudo minikube ip)/g" srcs/config.yaml
sed -i  "s/x.x.x.x/$(sudo minikube ip)/g" srcs/mysql/srcs/wordpress.sql
eval $(minikube docker-env)
docker build ./srcs/nginx -t nginx
docker build ./srcs/wordpress -t wordpress
docker build ./srcs/phpmyadmin -t phpmyadmin
docker build ./srcs/mysql -t mysql
docker build ./srcs/grafana -t grafana
docker build ./srcs/influxdb -t influxdb
docker build ./srcs/ftps -t ftps
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl apply -f srcs/config.yaml
kubectl apply -f srcs/deployment_nginx.yaml
kubectl apply -f srcs/deployment_phpmyadmin.yaml
kubectl apply -f srcs/deployment_mysql.yaml
kubectl apply -f srcs/deployment_wordpress.yaml
kubectl apply -f srcs/deployment_grafana.yaml
kubectl apply -f srcs/deployment_influxdb.yaml
kubectl apply -f srcs/deployment_ftps.yaml
sed -i  "s/$(sudo minikube ip)/x.x.x.x/g" srcs/mysql/srcs/wordpress.sql
sed -i  "s/$(sudo minikube ip)/x.x.x.x/g" srcs/config.yaml

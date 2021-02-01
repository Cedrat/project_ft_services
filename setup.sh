#!/bin/bash
sudo apt-get install conntrack
sudo minikube start --vm-driver=none
sed -i  "s/x.x.x.x/$(minikube ip)/g" config.yaml
eval $(minikube docker-env)
docker build ./nginx -t nginx
docker build ./wordpress -t wordpress
docker build ./phpmyadmin -t phpmyadmin
docker build ./mysql -t mysql
docker build ./grafana -t grafana
docker build ./influxdb -t influxdb
docker build ./ftps -t ftps
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl apply -f config.yaml
kubectl apply -f deployment_nginx.yaml
kubectl apply -f deployment_wordpress.yaml
kubectl apply -f deployment_phpmyadmin.yaml
kubectl apply -f deployment_mysql.yaml
kubectl apply -f deployment_grafana.yaml
kubectl apply -f deployment_influxdb.yaml
kubectl apply -f deployment_ftps.yaml

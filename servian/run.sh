#!/bin/bash

echo "building the go app on kubernetes"
echo "#################################"

#create configmap for postgres and go website
kubectl apply -f postgres-config.yaml
kubectl apply -f servian-config.yaml


#claim postgres persistent volume
kubectl apply -f postgres-storage.yaml


#deploy postgres database and service
kubectl apply -f postgres-deployment.yaml
kubectl apply -f postgres-service.yaml


#provision database for go app
kubectl apply -f servian-updatedb.yaml
kubectl delete -f servian-updatedb.yaml

#deploy go app and load balancer
kubectl apply -f servian-deployment.yaml
kubectl apply -f servian-service.yaml


#get the external IP of the LB
echo "Please wait while retrieving LBs IP"
sleep 30
lb_ip=$(kubectl describe services servian|grep "LoadBalancer Ingress"| awk '{print $3}')


echo "#####################################"
echo Use this IP $lb_ip to access the site


#enable horizontal pod autoscaling
echo "#####################################"
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

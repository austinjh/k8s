#!/bin/bash

# See https://minikube.sigs.k8s.io/docs/start/

minikube start --nodes 2 --driver=kvm2

minikube addons enable ingress 
minikube addons enable dashboard

sleep 60

kubectl apply -f dashboard-ingress.yaml

kubectl apply -f hello-deployment.yaml 

kubectl apply -f hello-svc.yaml

kubectl apply -f hello-ingress.yaml

kubectl apply -f ../mongo-exp/mongo-secret.yaml

kubectl apply -f ../mongo-exp/mongo.yaml

kubectl apply -f ../mongo-exp/mongo-configmap.yaml

kubectl apply -f ../mongo-exp/mongo-express.yaml

kubectl apply -f ../mongo-exp/mongoexp-ingress.yaml

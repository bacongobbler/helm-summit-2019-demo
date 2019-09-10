#!/bin/bash

kubectl create -f clusterrole-secret-reader.yaml

kubectl create namespace sam

openssl genrsa -out sam.key 2048
openssl req -new -key sam.key -out sam.csr -subj "/CN=sam/O=helmsummit"
openssl x509 -req -in sam.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out sam.crt -days 500

kubectl config set-credentials sam --client-certificate=sam.crt  --client-key=sam.key
kubectl config set-context sam --cluster=minikube --namespace=shared --user=sam

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update

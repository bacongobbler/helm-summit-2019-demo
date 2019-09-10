#!/bin/bash

kubectl create namespace bacongobbler

openssl genrsa -out bacongobbler.key 2048
openssl req -new -key bacongobbler.key -out bacongobbler.csr -subj "/CN=bacongobbler/O=helmsummit"
openssl x509 -req -in bacongobbler.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out bacongobbler.crt -days 500

kubectl config set-credentials bacongobbler --client-certificate=bacongobbler.crt  --client-key=bacongobbler.key
kubectl config set-context bacongobbler --cluster=minikube --namespace=bacongobbler --user=bacongobbler

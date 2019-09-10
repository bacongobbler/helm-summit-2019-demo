#!/bin/bash

kubectl create rolebinding "$1-edit" \
	--clusterrole edit \
	--user "$1" \
	--namespace "$2"

#!/bin/bash

kubectl create rolebinding "$1-view" \
	--clusterrole view \
	--user "$1" \
	--namespace "$2"


kubectl create rolebinding "$1-secret-reader" \
	--clusterrole secret-reader \
	--user "$1" \
	--namespace "$2"

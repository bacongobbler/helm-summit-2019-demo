#!/bin/bash

kubectl create clusterrolebinding "$1-view" \
	--clusterrole view \
	--user "$1"

kubectl create clusterrolebinding "$1-secret-reader" \
    --clusterrole secret-reader \
    --user "$1"

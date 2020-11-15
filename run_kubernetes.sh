#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
dockerpath=twi5tyx/DevOps-Capstone:predict

# Step 2:
kubectl run DevOps-Capstone --image=$dockerpath --port=8000

# Step 3:
kubectl get pods

# Step 4:
kubectl port-forward pods/DevOps-Capstone 8000:80

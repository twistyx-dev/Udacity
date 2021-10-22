#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=twi5tyx/project-5:predict
# Step 2
# Run the Docker Hub container with kubernetes
kubectl run project-5 --image=$dockerpath --port=8000
# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward pods/project-5 8000:80 

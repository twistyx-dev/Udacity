#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
dockerpath=twi5tyx/udacity-capstone:weather

# Step 2:
kubectl run DevOps-Capstone --image=$dockerpath --port=8000

# Step 3:
kubectl get pods

# Step 4:
kubectl port-forward pods/devOps-capstone 8000:80

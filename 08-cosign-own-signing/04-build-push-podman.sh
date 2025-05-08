#!/bin/bash
IMAGE=docker.io/chris438/node-k8s-app:latest

podman build -t $IMAGE .
podman login docker.io
podman push $IMAGE

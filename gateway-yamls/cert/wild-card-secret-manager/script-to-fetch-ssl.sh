#!/bin/bash

# Define secret names
CERT_SECRET_NAME="wildcard-cert-pem"
KEY_SECRET_NAME="wildcard-cert-key"
K8S_SECRET_NAME="wildcard-cert"
NAMESPACE="default"

# Fetch the certificate from Secret Manager
CERT=$(gcloud secrets versions access latest --secret="$CERT_SECRET_NAME")

# Fetch the key from Secret Manager
KEY=$(gcloud secrets versions access latest --secret="$KEY_SECRET_NAME")

# Create a Kubernetes secret from the fetched certificate and key
kubectl create secret tls $K8S_SECRET_NAME --cert=<(echo "$CERT") --key=<(echo "$KEY") -n $NAMESPACE

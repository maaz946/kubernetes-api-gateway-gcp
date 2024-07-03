# GKE Cluster Setup with Gateway API

To set up your GKE cluster with the Gateway API and run your backend services on the domain `sad-kistpay.com`, follow these steps:

## Enable Gateway API in GKE

You’ve already enabled the Gateway API in GKE through the console.

## Install Gateway API CRDs

Ensure the Gateway API Custom Resource Definitions (CRDs) are installed in your cluster.

## Set up GatewayClass

Create a `GatewayClass` to define the type of Gateway you will use.

## Create a Gateway

Define a `Gateway` that will manage traffic for your domain.

## Create a Certificate

Use `cert-manager` to issue a certificate for your domain. Ensure `cert-manager` is installed in your cluster.

### Using a Wildcard Certificate from GoDaddy

1. **Obtain the Wildcard Certificate from GoDaddy:**
   Purchase and download the wildcard certificate files from GoDaddy. You will typically get the certificate file (.crt or .pem) and the private key file (.key).

2. **Create a Kubernetes Secret for the Wildcard Certificate:**
   Store your certificate and key in a Kubernetes secret:
   ```sh
   kubectl create secret tls wildcard-cert --cert=path/to/your/cert.pem --key=path/to/your/key.pem -n default



### configure DNS
Update your DNS records to point to the external IP address of the Gateway once it is created. You can get the external IP by running:

kubectl get gateways -n default sad-kistpay-gateway


Create an A record for sad-kistpay.com pointing to the external IP address.
Create HTTPRoutes for Your Services
Define HTTPRoute resources to route traffic to your microservices.


### Usage (follow respected folders)
Use gateway, gateway-class, and route according to your needs (e.g., gateway-class: istio, nginx, traefik) with the appropriate route (gke, nginx, traefik).

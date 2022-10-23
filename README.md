# activity-planner
Platform repository for an AKS hosted NGINX server with PHP and some APIs with an aim to build in a microservice architecture.

## Overview
### containers
The ./containers folder is used to define some base images for development. The NGINX image is currently base, but allows for future dev
PHP is installed with MYSQL access, which isn't currently used but the capability has been added.
These images should exist as a pre-req:
1. Change the ACR variable in the Makefile to reflect your Container Registry. Then authenticate to it: https://docs.docker.com/engine/reference/commandline/login/
2. ``` make kickstart ```

### infrastrcuture
./infra is the Terraform definition for the environment, the only manual operation is to create the Storage Account state backend.
Login to azure using ``` az login ``` and then ``` make tfa ```
Once deployed there is currently a manual change where require secure transport needs to be turned off to allow git-sync to work. 

### apis
./apis is where the onging API development will occur. 
./apis/template acts as the base flask application
The current DB APIs is built using: ``` make pb-dbapi ```
./apis/database will query the MySQl Database created within the Terraform definition. The secret is defined as an environment variable which comes from AKS. For local development, the following command should be used:  ``` make run-dbapi mysql_password=ENTER_PASSWORD_HERE```

### K8s
All K8s definitions live within ./k8s/definitions (funny that)
akv-secret-sync.yaml is responsible for creating a k8s secret from the AKV
api.yaml; will create a deployment for the db api
git-sync.yaml is a nifty deployment to pull down the repo constantly to pull files onto a shared volume for consumption by NGINX. 
nginx.yaml deploys the NGINC services and deployments
php.yaml deploys all php aspects
public-lb.yaml sticks the cluster behind a public LB which allows access from the outside world into the NGINX service
storage.yaml uses Azure Files as a persistent volume

### ./build
This is just a location to stick your html files that will be accessed by the NGINX pods. This can be repointed within the Nginx Config Map

## Getting started
1. Deploy TF: ``` make tfa ```
2. Build the images ``` make kickstart && make pb-dbapi ```
3. Login the aks cluster using: ``` az aks get-credentials --resource-group myResourceGroup --name myAKSCluster ```
4. Use HELM to deploy the aks2k8s chart: https://akv2k8s.io/installation/on-azure-aks/
5. Spin up the K8s resources: ``` make k8-apply ```
6. Get the service of the public ip for access: ``` kubectl get services ```
7. Do stuff

### Useful Commands
``` 
kubectl exec --stdin --tty $name -- /bin/bash
kubectl port-forward deployment/nginx 8000:80
kubectl get secrets/db-user-pass --template={{.data.password}} | base64 -D
```
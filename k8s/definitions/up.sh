kubectl apply -f php_fpm_service.yaml
kubectl apply -f nginx_service.yaml
kubectl apply -f code_volume.yaml
kubectl apply -f php_deployment.yaml
kubectl apply -f nginx_configMap.yaml
kubectl apply -f nginx_deployment.yaml

kubectl create secret docker-registry <secret-name> \
    --namespace <namespace> \
    --docker-server=<container-registry-name>.azurecr.io \
    --docker-username=<service-principal-ID> \
    --docker-password=<service-principal-password>
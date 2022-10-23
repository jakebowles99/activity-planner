acr := activityplannerdev.azurecr.io

build-nginx:
	docker build -t $(acr)/nginx ./containers/nginx
push-nginx:
	docker push $(acr)/nginx
build-php:
	docker build -t $(acr)/php ./containers/php
push-php:
	docker push $(acr)/php
kickstart: build-nginx push-nginx build-php push-php
tfi:
	terraform -chdir=./infra init
tfp:
	terraform -chdir=./infra plan
tfa:
	terraform -chdir=./infra apply -auto-approve
build-dbapi:
	docker build -t $(acr)/api-flask ./apis/database
push-dbapi:
	docker push $(acr)/api-flask
run-dbapi:
	docker run -p 5000:5000 --env MYSQL_ROOT_PASSWORD=$(mysql_password) $(acr)/api-flask
pb-dbapi: build-dbapi push-dbapi
k8-apply:
	kubectl apply -f ./k8s/definitions
k8s-delete:
	kubectl delete -f ./k8s/definitions
k8s-exec:
	kubectl exec --stdin --tty $(name) -- /bin/bash

build-nginx:
	docker build -t activityplannerdev.azurecr.io/nginx ./containers/nginx
push-nginx:
	docker push activityplannerdev.azurecr.io/nginx
build-php:
	docker build -t activityplannerdev.azurecr.io/php ./containers/php
push-php:
	docker push activityplannerdev.azurecr.io/php
tfi:
	terraform -chdir=./infra init
tfp:
	terraform -chdir=./infra plan
tfa:
	terraform -chdir=./infra apply -auto-approve
build-dbapi:
	docker build -t activityplannerdev.azurecr.io/api-flask ./apis/database
push-dbapi:
	docker push activityplannerdev.azurecr.io/api-flask
run-dbapi:
	docker run -p 5000:5000 activityplannerdev.azurecr.io/api-flask
pb-dbapi: build-dbapi push-dbapi
k8-apply:
	kubectl apply -f ./k8s/definitions
k8s-delete:
	kubectl delete -f ./k8s/definitions
k8s-exec:
	kubectl exec --stdin --tty $(name) -- /bin/bash

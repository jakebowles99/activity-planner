build-nginx:
	docker build -t activityplannerdev.azurecr.io/nginx ./containers/nginx
push-nginx:
	docker push activityplannerdev.azurecr.io/nginx
build-php:
	docker build -t activityplannerdev.azurecr.io/php ./containers/php
push-php:
	docker push activityplannerdev.azurecr.io/php
tfi:
	tf -chdir=./infra init
tfp:
	tf -chdir=./infra plan
tfa:
	tf -chdir=./infra apply -auto-approve
db-api:
	docker build -t demo-flask ./apis/database
k8-apply:
	k apply -f k8/definitions
k8s-delete:
	k delete -f k8/definitions
	
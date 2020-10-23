#!/bin/bash

#updating terraform variable for project id and region
sed -i '.bak' "s/REPLACE_PROJ_ID/$1/g" terraform.tfvars
sed -i '.bak' "s/REPLACE_REGION/$2/g" terraform.tfvars

#initialize terraform workspace
./terraform init

#apply the terraform plan
./terraform apply

#retrieve the access credentials for your cluster and automatically configure 'kubectl'
gcloud container clusters get-credentials $(./terraform output kubernetes_cluster_name) --region $(./terraform output region)-a
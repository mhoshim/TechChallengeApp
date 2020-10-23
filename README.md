# Tech Challenge Application

## Prerequisites
- a GCP account
- a configured gcloud SDK
- kubectl
## Configure gcloud SDK (macOS)
`$brew cask install google-cloud-sdk`

`$gcloud init`

`$gcloud auth application-default login`
## Configure ‘kubectl’ (macOS)
`$brew install kubernetes-cli`

## Install terraform (macOS)
`$brew tap hashicorp/tap`

`$brew install hashicorp/tap/terraform`

## Folder structure

``` sh
── servian
    ├── postgres-config.yaml
    ├── postgres-deployment.yaml
    ├── postgres-service.yaml
    ├── postgres-storage.yaml
    ├── run.sh                        #atomation script to create pods and run go app
    ├── servian-config.yaml
    ├── servian-deployment.yaml
    ├── servian-service.yaml
    ├── servian-updatedb.yaml
    └── terraform
        ├── gke.tf
        ├── k8s.sh                    #automation script to build kubernetes cluster on GKE
        ├── terraform.tfstate
        ├── terraform.tfvars
        ├── versions.tf
        └── vpc.tf
```
        
## Build Kubernetes Cluster on GCP
- find your GCP project id using the following command
  
  `$gcloud config get-value project`
  
- run the file `./k8s.sh project_id region` #example: ./k8s.sh nonamed-utility-1234 asia-southeast1
## Start Deployment
- run the file `./run.sh`
## Outcome
- use the provided IP to access the application

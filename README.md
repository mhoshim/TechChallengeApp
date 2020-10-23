# Tech Challenge Application

##Prerequisites
- a GCP account
- a configured gcloud SDK
- kubectl
##Configure gcloud SDK (macOS)
$brew cask install google-cloud-sdk
$gcloud init
$gcloud auth application-default login
##Configure ‘kubectl’ (macOS)
$brew install kubernetes-cli
##Build Kubernetes Cluster on GCP
- find your GCP project id using the following command
  $gcloud config get-value project
- run the file “./k8s.sh project_id region” #example: ./k8s.sh nonamed-utility-1234 asia-southeast1
##Start Deployment
- run the file “./run.sh”
##Outcome
- use the provided IP to access the application

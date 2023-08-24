export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1
export KUBEFLOW_RELEASE_VERSION=v1.7.0
export AWS_RELEASE_VERSION=v1.7.0-aws-b1.0.2
export ROOT_DOMAIN=cmcloudlab733.info
export SUBDOMAIN=mlops.cmcloudlab733.info
export USER_POOL_NAME=kubeflow
export LOAD_BALANCER_SCHEME=internet-facing

terraform init && terraform plan
make deploy
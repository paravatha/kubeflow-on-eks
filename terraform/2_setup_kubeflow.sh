export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1
export KUBEFLOW_RELEASE_VERSION=v1.7.0
export AWS_RELEASE_VERSION=v1.7.0-aws-b1.0.2
export ROOT_DOMAIN=cmcloudlab733.info
export SUBDOMAIN=mlops.cmcloudlab733.info
export USER_POOL_NAME=kubeflow
export LOAD_BALANCER_SCHEME=internet-facing

cp *.tf kubeflow-manifests/deployments/cognito/terraform
cd kubeflow-manifests/deployments/cognito/terraform


cat <<EOF > sample.auto.tfvars
cluster_name="${CLUSTER_NAME}"
cluster_region="${CLUSTER_REGION}"
aws_route53_root_zone_name="${ROOT_DOMAIN}"
aws_route53_subdomain_zone_name="${SUBDOMAIN}"
cognito_user_pool_name="${USER_POOL_NAME}"
load_balancer_scheme="${LOAD_BALANCER_SCHEME}"
EOF


terraform init && terraform plan
make deploy
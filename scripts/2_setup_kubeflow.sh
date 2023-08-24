export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1
export KUBEFLOW_RELEASE_VERSION=v1.7.0
export AWS_RELEASE_VERSION=v1.7.0-aws-b1.0.2

cat <<EOF > sample.auto.tfvars
cluster_name="${CLUSTER_NAME}"
cluster_region="${CLUSTER_REGION}"
aws_route53_root_zone_name="${ROOT_DOMAIN}"
aws_route53_subdomain_zone_name="${SUBDOMAIN}"
cognito_user_pool_name="${USER_POOL_NAME}"
load_balancer_scheme="${LOAD_BALANCER_SCHEME}"
EOF


cp config/kustomization.yaml kubeflow-manifests/deployments/vanilla/kustomization.yaml
cd kubeflow-manifests

pwd
make deploy-kubeflow INSTALLATION_OPTION=kustomize DEPLOYMENT_OPTION=vanilla

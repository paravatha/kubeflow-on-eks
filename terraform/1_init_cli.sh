export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1
export KUBEFLOW_RELEASE_VERSION=v1.7.0
export AWS_RELEASE_VERSION=v1.7.0-aws-b1.0.2

cd kubeflow-manifests

make install-tools

kubectl version
eksctl version
pwd

cat ../../config/bashrc >> ~/.bashrc
source ~/.bashrc
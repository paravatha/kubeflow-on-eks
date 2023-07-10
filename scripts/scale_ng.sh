export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1

eksctl scale nodegroup --cluster=${CLUSTER_NAME} --name=managed-ng-t2 --nodes=3
eksctl scale nodegroup --cluster=${CLUSTER_NAME} --name=managed-ng-t3 --nodes=3

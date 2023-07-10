export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1

eksctl scale nodegroup --name ${CLUSTER_NAME}  --nodes=3 --name=managed-ng-t2
eksctl scale nodegroup --name ${CLUSTER_NAME}  --nodes=3 --name=managed-ng-t3

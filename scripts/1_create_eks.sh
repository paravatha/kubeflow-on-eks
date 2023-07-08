export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1

eksctl create cluster -f config/cluster.yaml

#eksctl create cluster --name ${CLUSTER_NAME} --version 1.25 \
#  --region ${CLUSTER_REGION} --nodegroup-name linux-nodes \
#  --node-type t3.medium --nodes 0 --nodes-min 0 --nodes-max 5 \
#  --managed --with-oidc

# in Cloud 9
aws configure --profile=kubeflow

mkdir ~/.aws && touch ~/.aws/config
vi ~/.aws/config
[profile kubeflow]
aws_access_key_id=
aws_secret_access_key=
region=us-east-1
output=json

aws sts get-caller-identity

export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1

export KUBEFLOW_RELEASE_VERSION=v1.7.0
export AWS_RELEASE_VERSION=v1.7.0-aws-b1.0.2

git clone https://github.com/awslabs/kubeflow-manifests.git && cd kubeflow-manifests
git checkout ${AWS_RELEASE_VERSION}
git clone --branch ${KUBEFLOW_RELEASE_VERSION} https://github.com/kubeflow/manifests.git upstream
make install-tools

eksctl create cluster --name ${CLUSTER_NAME} --version 1.25 \
  --region ${CLUSTER_REGION} --nodegroup-name linux-nodes \
  --node-type t3.medium --nodes 0 --nodes-min 0 --nodes-max 5 \
  --managed --with-oidc

#git clone https://github.com/paravatha/kubeflow-aws-manifests
#eksctl get addon --name aws-ebs-csi-driver --cluster ${CLUSTER_NAME}
#kubectl describe daemonset aws-node --namespace kube-system | grep amazon-k8s-cni: | cut -d : -f 3
## add EBS and VPC add-ons
## grant EBS permissions to nodegroups, EBSCSI and EBS create
eksctl scale nodegroup --cluster=${CLUSTER_NAME} --nodes=4 linux-nodes

make deploy-kubeflow INSTALLATION_OPTION=kustomize DEPLOYMENT_OPTION=vanilla

# update tests/e2e/utils/load_balancer/lb_config.yaml
cp ./config/lb_config.yaml tests/e2e/utils/load_balancer/config.yaml
cd tests/e2e
python3.8 -m pip install -r requirements.txt
PYTHONPATH=.. python3.8 utils/load_balancer/setup_load_balancer.py

# https://github.com/kubeflow/manifests/blob/master/README.md#port-forward
# https://github.com/kubeflow/manifests/blob/master/README.md#change-default-user-password

DELETE
# Check if there any external IP svc
kubectl get svc --all-namespaces
eksctl delete cluster --name kf-test

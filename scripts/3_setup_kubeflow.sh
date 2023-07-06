export AWS_PROFILE=kubeflow
export CLUSTER_NAME=kubeflow
export CLUSTER_REGION=us-east-1
export KUBEFLOW_RELEASE_VERSION=v1.7.0
export AWS_RELEASE_VERSION=v1.7.0-aws-b1.0.2
export AWS_ACCOUNT=

make deploy-kubeflow INSTALLATION_OPTION=kustomize DEPLOYMENT_OPTION=vanilla

# update tests/e2e/utils/load_balancer/config.yaml
cp ../config/lb_config.yaml tests/e2e/utils/load_balancer/config.yaml
cd tests/e2e
python3.8 -m pip install -r requirements.txt
PYTHONPATH=.. python3.8 utils/load_balancer/setup_load_balancer.py

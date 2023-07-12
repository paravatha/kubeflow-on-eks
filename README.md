# kubeflow-on-eks
```
git clone https://github.com/paravatha/kubeflow-on-eks
cd kubeflow-on-eks
```
- update aws_config and copy
```
cp config/aws_config ~/.aws/config
```

- Update bash profile
```
alias c=clear
alias gs='git status '
alias gpl='git pull '
alias gps='git push '
```
- Setup kubectl auto complete
```
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
```
- Run pre install scripts
```
./scripts/0_init_kubeflow_cli.sh
./scripts/1_create_eks.sh
```
- Copy kustomize config
```
cp config/congnito-kustomization.yaml kubeflow-manifests/deployments/cognito/kustomization.yaml 
```
- Setup KF

- Update eks KF loadbalancer IAM roles with AddTags permissions

- Follow these guides 
  * https://awslabs.github.io/kubeflow-manifests/main/docs/deployment/cognito/manifest/guide-automated/
  * https://www.kubeflow.org/docs/components/multi-tenancy/getting-started/#manual-profile-creation
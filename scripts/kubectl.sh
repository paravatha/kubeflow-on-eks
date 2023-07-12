curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k

source ~/.bashrc

aws eks update-kubeconfig --region us-east-1 --name kubeflow
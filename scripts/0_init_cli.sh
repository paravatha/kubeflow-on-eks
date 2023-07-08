kubectl version

echo -e "\nalias gs='git status '" >> ~/.bashrc
echo -e "\nalias gpl='git pull '" >> ~/.bashrc
echo -e "\nalias gps='git push '" >> ~/.bashrc

echo 'alias c=clear' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

source ~/.bashrc
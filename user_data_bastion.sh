#!/usr/bin/env bash

if [ "$(. /etc/os-release; echo $NAME)" = "Ubuntu" ]; then
  sudo apt-get update 
  sudo apt-get -y install python 
  sudo apt-get -y install python-pip unzip 
  sudo pip install ansible 
  git clone https://github.com/wadeholler/tf-kubeadm-ha.git 
  wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip -O /tmp/output.zip 
  unzip /tmp/output.zip 
  chmod +x terraform 
  sudo mv terraform /usr/local/bin/. 
  chmod 0400 ~/key.pem 
  cd tf-kubeadm-ha 
  terraform init 
  terraform state pull > terraform.tfstate 
  export ANSIBLE_HOST_KEY_CHECKING=False 
  export TF_KEY_NAME=private_ip 
  nohup ansible-playbook -i ./terraform-inventory -b --private-key  ~/key.pem ansible/kubeadm-ha.yaml  --extra-vars "kubernetes_api_lb_name=$(terraform output kubeadm-master-elb)" 2>&1 &
fi

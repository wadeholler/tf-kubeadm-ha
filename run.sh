#!/usr/bin/env bash

terraform apply --auto-approve -var "keyfile=$1" &&
ssh -o StrictHostKeyChecking=no -i $1 ubuntu@$(terraform output bastion_public_ips) sh /home/ubuntu/user_data_bastion.sh
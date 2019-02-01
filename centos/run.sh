#!/usr/bin/env bash

terraform apply --auto-approve -var "keyfile=$1" &&
ssh -o StrictHostKeyChecking=no -i $1 centos@$(terraform output bastion_public_ips) sh /home/centos/user_data_bastion.sh

# tf-kubeadm-ha

* make a bucket

    aws s3 mb s3://tfkubeadmstate

* run the terraform

    sh run.sh ../key.pem
    ssh -i ../key.pem ubuntu@$(terraform output bastion_public_ips)
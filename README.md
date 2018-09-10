# tf-kubeadm-ha

* make a bucket

    aws s3 mb s3://tfkubeadmstate

* create a IAM profile with EC2, ELB, ELB2, and S3 all perms all resources

* run the terraform

    sh run.sh ../key.pem
    ssh -i ../key.pem ubuntu@$(terraform output bastion_public_ips)
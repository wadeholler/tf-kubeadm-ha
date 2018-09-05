# tf-kubeadm-ha

* make a bucket

    aws s3 mb s3://tfkubeadmstate

* run the terraform

    terraform apply -var "keyfile=../key.pem"
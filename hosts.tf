resource "aws_instance" "kubeadm_master" {
  count = "${var.node_count_master}"
  ami           = "${var.node_ami}"
  instance_type = "t2.large"
  subnet_id = "${lookup(var.subnets, count.index%var.num_subnets)}"
  vpc_security_group_ids = ["${aws_security_group.kubeadm.id}"]
  key_name = "${var.key}"
  iam_instance_profile = "rancher-ec2-role"
  associate_public_ip_address = true

  tags {
    Name = "${format("%s%d","kubeadm-master-",count.index)}"
    Role = "master"
    "kubernetes.io/cluster/kubernetes" = "kubernetes"
  }
}
output "master_nodes_ips" {
  value = "${aws_instance.kubeadm_master.*.private_ip}"
}
resource "aws_instance" "kubeadm_etcd" {
  count = "${var.node_count_etcd}"
  ami           = "${var.node_ami}"
  instance_type = "t2.large"
  subnet_id = "${lookup(var.subnets, count.index%var.num_subnets)}"
  vpc_security_group_ids = ["${aws_security_group.kubeadm.id}"]
  key_name = "${var.key}"
  iam_instance_profile = "rancher-ec2-role"
  associate_public_ip_address = true

  tags {
    Name = "${format("%s%d","kubeadm-etcd-",count.index)}"
    Role = "etcd"
    "kubernetes.io/cluster/kubernetes" = "kubernetes"
  }
}
output "etcd" {
  value = "${aws_instance.kubeadm_etcd.*.private_ip}"
}
resource "aws_instance" "kubeadm_node" {
  count = "${var.node_count_node}"
  ami           = "${var.node_ami}"
  instance_type = "t2.large"
  subnet_id = "${lookup(var.subnets, count.index%var.num_subnets)}"
  vpc_security_group_ids = ["${aws_security_group.kubeadm.id}"]
  key_name = "${var.key}"
  iam_instance_profile = "rancher-ec2-role"
  associate_public_ip_address = true

  tags {
    Name = "${format("%s%d","kubeadm-node-",count.index)}"
    Role = "node"
    "kubernetes.io/cluster/kubernetes" = "kubernetes"
  }
}
output "node" {
  value = "${aws_instance.kubeadm_node.*.private_ip}"
}
resource "aws_instance" "kubeadm_ingress" {
  count = "${var.node_count_ingress}"
  ami           = "${var.node_ami}"
  instance_type = "t2.large"
  subnet_id = "${lookup(var.subnets, count.index%var.num_subnets)}"
  vpc_security_group_ids = ["${aws_security_group.kubeadm.id}"]
  key_name = "${var.key}"
  iam_instance_profile = "rancher-ec2-role"
  associate_public_ip_address = true

  tags {
    Name = "${format("%s%d","kubeadm-ingress-",count.index)}"
    Role = "ingress"
    "kubernetes.io/cluster/kubernetes" = "kubernetes"
  }
}
output "ingress" {
  value = "${aws_instance.kubeadm_ingress.*.private_ip}"
}

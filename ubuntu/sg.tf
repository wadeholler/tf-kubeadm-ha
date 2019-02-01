resource "aws_security_group" "kubeadm" {
  name        = "kubeadm"
  description = "Allow all kubeadm traffic"
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "kubeadm_sg"
    KubernetesCluster = "kubernetes"
    "kubernetes.io/cluster/kubernetes" = "kubernetes"
  }
}
resource "aws_security_group" "kubeadm-elb" {
  name        = "kubeadm-elb"
  description = "Allow all kubeadm traffic"
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "kubeadm_sg-elb"
  }
}

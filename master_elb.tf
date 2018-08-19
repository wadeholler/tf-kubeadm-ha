# Create a new load balancer
resource "aws_elb" "kubeadm-elb" {
  name               = "kubeadm-tf-elb"
#  availability_zones = ["us-gov-west-1a", "us-gov-west-1b"]
  security_groups = ["${aws_security_group.kubeadm.id}","${aws_security_group.kubeadm-elb.id}"]
  subnets = "${values(var.subnets)}"
  internal = true

  listener {
    instance_port     = 6443
    instance_protocol = "tcp"
    lb_port           = 6443
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:6443"
    interval            = 30
  }

  instances                   = ["${aws_instance.kubeadm_master.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "kubeadm-tf-elb"
  }
}
output "kubeadm-master-elb" {
  value = "${aws_elb.kubeadm-elb.dns_name}"
}

variable "vpc-id" {
  default = "vpc-3ce2d45a"
}
variable "subnets" {
  default = {
    "0" = "subnet-c37766ee"
  }
}
variable "num_subnets" {
  default = 1
}
variable "key" {
  default = "wadeITTLPC"
}
variable "node_count_bastion" {
  default = 1
}
variable "node_count_master" {
  default = 2
}
variable "node_count_etcd" {
  default = 3
}
variable "node_count_node" {
  default = 2
}
variable "node_count_ingress" {
  default = 2
}
variable "node_ami" {
#  default = "ami-90b034f1"
  default = "ami-04169656fea786776"
}

variable "user_data" {
  default = "user_data.sh"
}
variable "user_data_bastion" {
  default = "user_data_bastion.sh"
}
variable "keyfile" {}
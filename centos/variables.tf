variable "vpc-id" {
  default = "vpc-07a2ec8df7acb8e47"
}
variable "subnets" {
  default = {
    "0" = "subnet-00d43238aacaede1a"
    "1" = "subnet-069e437f05012ccdb"
    "2" = "subnet-082c4be3d6f8ea341"
  }
}
variable "num_subnets" {
  default = 3
}
variable "key" {
  default = "wadeITTLPC6"
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
  default = 0
}
variable "node_ami" {
#  default = "ami-90b034f1"
  default = "ami-05936bd2fead09ebd"
}

variable "user_data" {
  default = "user_data.sh"
}
variable "user_data_bastion" {
  default = "user_data_bastion.sh"
}
variable "keyfile" {}

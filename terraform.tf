terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "tfkubeadmstate"
    key    = "terraform/terraform.tfstate"
    profile = "commercial"
  }
}
resource "aws_instance" "sandbox" {
  ami = "ami-785c491f"
  instance_type = "t2.micro"
  subnet_id = "${data.terraform_remote_state.vpc.public_subnet_id}"
}

provider "aws" {
    region = "ap-northeast-1"
}

data "terraform_remote_state" "vpc" {
    backend = "s3"
    
    config = {
        bucket = "fabulous-terraform"
        key = "test/vpc/terraform.tfstate"
        region = "ap-northeast-1"
    }
}

terraform {
    backend "s3" {
        bucket = "fabulous-terraform"
        key = "test/ec2/terraform.tfstate"
        region = "ap-northeast-1"
    }
}
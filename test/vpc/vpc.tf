resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
}

resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.16.0/20"
  availability_zone = "ap-northeast-1a"
}

provider "aws" {
  region = "ap-northeast-1"
}

output "public_subnet_id" {
    value = "${aws_subnet.public_subnet.id}"
}

terraform {
  backend "s3" {
    bucket = "fabulous-terraform"
    key = "test/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
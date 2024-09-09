provider "aws" {
  region = "us-east-2"  # Replace with your desired AWS region
}

resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
  }
}

 #vpc_id = var.vpc_id

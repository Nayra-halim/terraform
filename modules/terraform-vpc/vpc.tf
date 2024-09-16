provider "aws" {
  region = "us-east-2"  # Replace with your desired AWS region
}

resource "aws_vpc" "demo-vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
  }
}
resource "aws_subnet" "public" {
  #count=3
  vpc_id = aws_vpc.demo-vpc.id
  cidr_block = var.public_subnet_cidr
  #cidr_block = "10.0.${count.index}.0/24"
  #availability_zone = "us-east-2"
  for_each = var.zone
  availability_zone  = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }

}
resource "aws_subnet" "private" {
 count=3
 vpc_id = aws_vpc.demo-vpc.id
 cidr_block = "10.1.${count.index}.0/24"
 #cidr_block = var.private_subnet_cidr
  tags = {
    Name = "private-subnet"
  }
   
}

 #vpc_id = var.vpc_id

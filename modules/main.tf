provider "aws" {
  region = "us-east-2"  # Replace with your desired AWS region
}

module "Nayra" {
    source = "./terraform-vpc"
    cidr_block = "10.1.0.0/16"
    public_subnet_cidr= "10.1.0.0/24"
    private_subnet_cidr = "10.1.1.0/24"
}


resource "aws_instance" "dataserver" {
    ami = "ami-085f9c64a9b75eed5"
    #ami           = var.image_id
    instance_type = "t2.micro"
    #subnet_id = module.Nayra.public_subnet_id["zone2"]
    lifecycle {
      prevent_destroy = true
    }
    tags = {
        Name = "Nano"
    }
}
resource "aws_instance" "webserver" {
  ami           = "ami-09efc42336106d2f2"
  instance_type = "t2.micro"
  #subnet_id = module.Nayra.aws_subnet.public.id
  depends_on = [aws_instance.dataserver]

  tags = {
    Name = "nero"
  }
}
resource "aws_instance" "nano" {
    ami = "ami-085f9c64a9b75eed5"
    #ami           = var.image_id
    instance_type = "t2.micro"

    tags = {
        Name = "Nayra"
    }
}
resource "aws_instance" "web" {
  ami           = "ami-09efc42336106d2f2"
  instance_type = "t2.micro"

  tags = {
    Name = "nero"
  }
}
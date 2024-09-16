output "public_subnet_id" {
    value = aws_subnet.public["zone2"]
}

#output "private_subnet_id" {
 #   value =  aws_subnet.private[count.index]
#}

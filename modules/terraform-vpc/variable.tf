variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "zone" {
    default= {
        zone1 = "us-east-2a"
        zone2 = "us-east-2b"
    }
}
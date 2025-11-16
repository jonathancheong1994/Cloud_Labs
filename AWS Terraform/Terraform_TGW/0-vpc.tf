resource "aws_vpc" "vpc1" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc1"
  }
}

resource "aws_vpc" "vpc2" {
  cidr_block           = "10.2.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "vpc2"
  }
}

resource "aws_vpc" "vpc3" {
  cidr_block           = "10.3.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc3"
  }
}

resource "aws_subnet" "vpc1-subnet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.1.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc1-subnet1"
  }
}

resource "aws_subnet" "vpc1-subnet2" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc1-subnet2"
  }
}

resource "aws_subnet" "vpc2-subnet1" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.2.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "vpc2-subnet1"
  }
}

resource "aws_subnet" "vpc2-subnet2" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "vpc2-subnet2"
  }
}
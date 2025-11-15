resource "aws_subnet" "isolated_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "terraform-deploy-dev-isolated-subnet1"
  }
}

resource "aws_subnet" "isolated_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    "Name" = "terraform-deploy-dev-isolated-subnet2"
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "terraform-deploy-dev-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "terraform-deploy-dev-nat-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${local.env}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${local.env}-nat-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}

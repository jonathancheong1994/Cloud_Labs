resource "aws_route_table" "vpc1-public-rt" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc1-igw.id
  }

  route {
    cidr_block         = "10.2.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id
  }

  route {
    cidr_block = "10.3.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id
  }

  tags = {
    Name = "vpc1-public-rt"
  }
}

resource "aws_route_table_association" "vpc1-public-rt-assoc1" {
  subnet_id      = aws_subnet.vpc1-subnet1.id
  route_table_id = aws_route_table.vpc1-public-rt.id
}

resource "aws_route_table_association" "vpc1-public-rt-assoc2" {
  subnet_id      = aws_subnet.vpc1-subnet2.id
  route_table_id = aws_route_table.vpc1-public-rt.id
}

resource "aws_route_table" "vpc2-private-rt" {
  vpc_id = aws_vpc.vpc2.id

  route {
    cidr_block         = "10.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id
  }

  route {
    cidr_block         = "10.3.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id
  }

  tags = {
    Name = "vpc2-private-rt"
  }
}

resource "aws_route_table_association" "vpc2-private-rt-assoc1" {
  subnet_id      = aws_subnet.vpc2-subnet1.id
  route_table_id = aws_route_table.vpc2-private-rt.id
}

resource "aws_route_table_association" "vpc2-private-rt-assoc2" {
  subnet_id      = aws_subnet.vpc2-subnet2.id
  route_table_id = aws_route_table.vpc2-private-rt.id
}

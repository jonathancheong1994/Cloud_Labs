resource "aws_network_acl" "vpc1-nacl" {
  vpc_id = aws_vpc.vpc1.id

  egress {
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    rule_no    = 10
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }
  ingress {
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    rule_no    = 10
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "vpc1-nacl"
  }
}

resource "aws_network_acl_association" "vpc1-nacl-assoc1" {
  subnet_id      = aws_subnet.vpc1-subnet1.id
  network_acl_id = aws_network_acl.vpc1-nacl.id
}
resource "aws_network_acl_association" "vpc1-nacl-assoc2" {
  subnet_id      = aws_subnet.vpc1-subnet2.id
  network_acl_id = aws_network_acl.vpc1-nacl.id
}

resource "aws_network_acl" "vpc2-nacl" {
  vpc_id = aws_vpc.vpc2.id

  egress {
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    rule_no    = 10
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    rule_no    = 10
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "vpc2-nacl"
  }
}
resource "aws_network_acl_association" "vpc2-nacl-assoc1" {
  subnet_id      = aws_subnet.vpc2-subnet1.id
  network_acl_id = aws_network_acl.vpc2-nacl.id
}

resource "aws_network_acl_association" "vpc2-nacl-assoc2" {
  subnet_id      = aws_subnet.vpc2-subnet2.id
  network_acl_id = aws_network_acl.vpc2-nacl.id
}
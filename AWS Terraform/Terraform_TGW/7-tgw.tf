resource "aws_ec2_transit_gateway" "TGW_Lab" {
  description                     = "TGW for Lab"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name = "TGW_Lab"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_A" {
  subnet_ids         = [aws_subnet.vpc1-subnet1.id, aws_subnet.vpc1-subnet2.id]
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id
  vpc_id             = aws_vpc.vpc1.id

  tags = {
    Name = "TGA_VPC_A"
  }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_A" {
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id

  tags = {
    "name" = "TGW_RTB_VPC_A"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_A_Route_1" {
  destination_cidr_block         = "10.2.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_B.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A.id
}

resource "aws_ec2_transit_gateway_route_table_association" "TGW_RTB_Assoc_VPC_A" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_A.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_B" {
  subnet_ids         = [aws_subnet.vpc2-subnet1.id, aws_subnet.vpc2-subnet2.id]
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id
  vpc_id             = aws_vpc.vpc2.id

  tags = {
    Name = "TGA_VPC_B"
  }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_B" {
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Lab.id

  tags = {
    "name" = "TGW_RTB_VPC_B"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_B_Route_1" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_A.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_B.id
}

resource "aws_ec2_transit_gateway_route_table_association" "TGW_RTB_Assoc_VPC_B" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_B.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_B.id
}
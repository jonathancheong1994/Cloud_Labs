resource "aws_instance" "Bastion" {
  ami                    = "ami-0cae6d6fe6048ca2c"
  instance_type          = "t2.micro"
  tenancy                = "default"
  subnet_id              = aws_subnet.vpc1-subnet1.id
  vpc_security_group_ids = [aws_security_group.vpc1-nsg.id]
  key_name               = aws_key_pair.generated.key_name
  #   security_groups   = [aws_security_group.vpc1-nsg.id]

  tags = {
    "name" = "Bastion"
  }
}

resource "aws_instance" "DB_1" {
  ami                    = "ami-0cae6d6fe6048ca2c"
  instance_type          = "t2.micro"
  tenancy                = "default"
  subnet_id              = aws_subnet.vpc2-subnet1.id
  vpc_security_group_ids = [aws_security_group.vpc2-nsg.id]
  key_name               = aws_key_pair.generated.key_name
  #   security_groups   = [aws_security_group.vpc2-nsg.id]

  tags = {
    "name" = "DB_1"
  }
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "bastion-ssh-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/bastion-ssh-key.pem"
  file_permission = "0600"
}

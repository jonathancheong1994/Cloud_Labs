This folder is the base set up with a terraform file for each resource set up

The following resources are built:

1. 2 VPC
2. Public subnets in VPC1 and Private Subnets in VPC2
3. 1 EC2 instance per VPC with ssh keys
4. Private and Public routing tables with TGW attachments
5. Transit Gateway

Pending Update:
Streamlining NACL too be more secure
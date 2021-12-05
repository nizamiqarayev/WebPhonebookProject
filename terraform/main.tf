terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile = "terraform-aws"
}
resource "aws_vpc" "vpc_pb" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_pb"
  }
}
resource "aws_subnet" "gwsub" {
  vpc_id     = aws_vpc.vpc_pb.id
  cidr_block = "10.0.19.0/24"
  availability_zone = data.aws_availability_zones.zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "gwsub"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_pb.id

  tags = {
    Name = "vpcpbGateway"
  }
}
resource "aws_egress_only_internet_gateway" "egress_gw" {
  vpc_id = aws_vpc.vpc_pb.id

  tags = {
    Name = "pbEgressgateway"
  }
}
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_pb.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egress_gw.id
  }

  tags = {
    Name = "pbroutetable"
  }
}
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.gwsub.id
  route_table_id = aws_route_table.rt.id
}
resource "aws_route_table_association" "asgrt1" {
  subnet_id      = aws_subnet.asgsubnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "asgrta2" {
  subnet_id      = aws_subnet.asgsubnet2.id
  route_table_id = aws_route_table.rt.id
}
resource "aws_network_interface" "pb_NI" {
  subnet_id       = aws_subnet.gwsub.id
  private_ips     = ["10.0.19.50"]
  security_groups = [aws_security_group.public_pb.id]
}
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.pb_NI.id
  associate_with_private_ip = "10.0.19.50"
  depends_on = [
     aws_internet_gateway.gw
  ]

  
}




resource "tls_private_key" "template1_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "key" {
  key_name   = "pb_key"
  public_key = tls_private_key.template1_key.public_key_openssh
}


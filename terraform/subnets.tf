data "aws_availability_zones" "zones"{
    state = "available"
}
resource "aws_subnet" "dbsub1" {
  vpc_id     = aws_vpc.vpc_pb.id
  cidr_block = "10.0.20.0/24"
  availability_zone = data.aws_availability_zones.zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "dbsubnet1"
  }
}
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "main"
  subnet_ids = [aws_subnet.dbsub1.id,aws_subnet.dbsub2.id]

  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_subnet" "dbsub2" {
  vpc_id     = aws_vpc.vpc_pb.id
  cidr_block = "10.0.21.0/24"
  availability_zone = data.aws_availability_zones.zones.names[4]
  map_public_ip_on_launch = true

  tags = {
    Name = "dbsubnet2"
  }
}
resource "aws_subnet" "lbsub1" {
  vpc_id     = aws_vpc.vpc_pb.id
  cidr_block = "10.0.22.0/24"
    availability_zone = data.aws_availability_zones.zones.names[2]

  tags = {
    Name = "lbsubnet1"
  }
}
resource "aws_subnet" "lbsub2" {
  vpc_id     = aws_vpc.vpc_pb.id
  cidr_block = "10.0.23.0/24"
availability_zone = data.aws_availability_zones.zones.names[5]

  tags = {
    Name = "lbsubnet2"
  }
}
resource "aws_subnet" "asgsubnet1" {
  vpc_id     = aws_vpc.vpc_pb.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.24.0/24"
  availability_zone = data.aws_availability_zones.zones.names[3]

  tags = {
    Name = "asgsub1"
  }
}
resource "aws_subnet" "asgsubnet2" {
  vpc_id     = aws_vpc.vpc_pb.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.25.0/24"
  availability_zone = data.aws_availability_zones.zones.names[3]

  tags = {
    Name = "asgsub2"
  }
}
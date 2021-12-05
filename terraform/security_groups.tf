resource "aws_security_group" "public_pb" {
  name        = "publicpb"
  description = "public "
  vpc_id      = aws_vpc.vpc_pb.id
   ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
      from_port = 0
      protocol = "TCP"
      to_port = 65535
      cidr_blocks = ["0.0.0.0/0"]
    }
}
# resource "aws_security_group" "public_pb" {
#   name        = "publicpb"
#   description = "public "
#   vpc_id      = aws_vpc.vpc_pb.id
#    ingress {
#     from_port = 3000
#     to_port = 3000
#     protocol = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#     }

#   egress {
#       from_port = 0
#       protocol = "TCP"
#       to_port = 65535
#       cidr_blocks = ["10.0.0.0/0"]
#     }
# }
#
resource "aws_security_group" "private_pb" {
  name        = "privatepb"
  description = "private"
  vpc_id      = aws_vpc.vpc_pb.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }

}
resource "aws_security_group" "serversecurity" {

  name        = "serversg"
  vpc_id = aws_vpc.vpc_pb.id

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
      from_port = 0
      to_port =  0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "dbsecurity" {

  name        = "dbSg"
  vpc_id = aws_vpc.vpc_pb.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    security_groups = [aws_security_group.private_pb.id]
    }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
#  resource "aws_security_group_rule" "public_rule1" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.public_pb.id
# }
# resource "aws_security_group_rule" "public_rule2" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.public_pb.id
# }
# resource "aws_security_group_rule" "public_rule3" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       =["0.0.0.0/0"]
#   security_group_id = aws_security_group.public_pb.id
# }
# resource "aws_security_group_rule" "private_rule1" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.private_pb.id
# }
# resource "aws_security_group_rule" "private_rule2" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "-1"
#   cidr_blocks       = [aws_vpc.vpc_pb.cidr_block]
#   security_group_id = aws_security_group.private_pb.id
# }
























# resource "aws_security_group" "web_pb" {
#   name        = "web"
#   vpc_id = aws_vpc.vpc_pb.id
#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#     }

#   egress {
#       from_port = 0
#       protocol = "TCP"
#       to_port = 65535
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   tags = {
#     Name = "sg"
#   }
# }
# resource "aws_security_group" "ssh_pb" {
#   name        = "ssh_pb"
#   vpc_id = aws_vpc.vpc_pb.id
#     ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#     }
#   tags = {
#     Name = "ssh-sg"
#   }
# }

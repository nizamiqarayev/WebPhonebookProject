resource "aws_placement_group" "placement_group" {
  name     = "pbplacement"
  strategy = "spread"
}


resource "aws_launch_template" "launch_temp1" {

  name = "lt-pb-app1"

  instance_type = "t2.micro"

  image_id = "ami-04902260ca3d33422"

  instance_initiated_shutdown_behavior = "terminate"

  update_default_version = true
  depends_on = [
    aws_db_instance.db
  ]

key_name = aws_key_pair.key.key_name

  network_interfaces {
    associate_public_ip_address = true

    security_groups = [
      aws_security_group.public_pb.id,
      aws_security_group.private_pb.id,
      aws_security_group.serversecurity.id
    ]
  }

  placement {
    availability_zone = "us-east-1"
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pb-app"
    }
  }

  user_data = filebase64("files/user_data.sh")
}

# resource "aws_launch_template" "launch_temp2" {

#   name = "lt-pb-app2"

#   instance_type = "t2.micro"

#   image_id = "ami-04902260ca3d33422"

#   instance_initiated_shutdown_behavior = "terminate"

#   update_default_version = true

#   key_name = aws_key_pair.key.key_name

#   network_interfaces {
#     associate_public_ip_address = true

#     security_groups = [
#       aws_security_group.web.id,
#       aws_security_group.ssh.id
#     ]
#   }

#   placement {
#     availability_zone = "us-east-2a"
#   }
#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "pb-app"
#     }
#   }

#   user_data = filebase64("files/user_data.sh")
# }
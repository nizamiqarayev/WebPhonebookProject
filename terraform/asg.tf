


resource "aws_autoscaling_group" "pb_asg" {

  name = "phonebook_asg"

  vpc_zone_identifier  = [aws_subnet.asgsubnet1.id, aws_subnet.asgsubnet2.id]
  desired_capacity   = 2
  max_size           = 10
  min_size           = 2
  target_group_arns = [
      aws_lb_target_group.lb_target_group.arn
  ]

  health_check_grace_period =  10
  protect_from_scale_in = false
  launch_template {
    id      = aws_launch_template.launch_temp1.id
    version = "$Latest"
  }

  tag {
      key   = "sg"
      propagate_at_launch = true
      value = "pb-app"
  }
  }


  # resource "aws_autoscaling_policy" "sc_p" {
#   name        = "requests_count_scaling_policy"
#   policy_type = "TargetTrackingScaling"

#   autoscaling_group_name = aws_autoscaling_group.pb_asg.name

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ALBRequestCountPerTarget"
#       resource_label = format("%s/%s", aws_lb.pb_proj_lb.arn_suffix, aws_lb_target_group.load_balancer.arn_suffix)
#     }

#     target_value = 100
#   }
#   cooldown = 60
# }
# resource "aws_autoscaling_policy" "policy" {
#   name                   = "asp"
#   policy_type = "TargetTrackingScaling"
#     autoscaling_group_name = aws_autoscaling_group.pb_asg.name

#     target_tracking_configuration {
#   predefined_metric_specification{
#     predefined_metric_type="ALBRequestCountPerTarget"
#     resource_label = format("%s/%s", aws_lb.pb_proj_lb.arn_suffix, aws_lb_target_group.lb_target_group.arn_suffix)
#   }
#     target_value = 30
#   }
#   cooldown = 60
#   }
#   resource "aws_autoscaling_group" "pb_asg" {
#   name                      = "phonebook_asg"
#   max_size                  = 10
#   min_size                  = 2
#   health_check_grace_period = 60
#   health_check_type         = "ELB"
#   desired_capacity          = 2
#   force_delete              = true
#   placement_group           = aws_placement_group.pbplacement.id
#  launch_template {
#     id      = aws_launch_template.launch_temp1.id
#     version = "$Latest"
#   }
#   vpc_zone_identifier       = [aws_subnet.asgsubnet1.id, aws_subnet.asgsubnet1.id]

  
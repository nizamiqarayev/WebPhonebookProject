resource "aws_autoscaling_policy" "scale_up_policy" {
name = "scaleup"
autoscaling_group_name = aws_autoscaling_group.pb_asg.name
adjustment_type = "ChangeInCapacity"
scaling_adjustment = "1"
cooldown = "60"
policy_type = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
alarm_name = "scaleUpAlarm"
alarm_description = "alarm for the scale up"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "RequestCount"
namespace = "AWS/ApplicationELB"
period = "60"
statistic = "Average"
threshold = "30"
dimensions = {
    TargetGroup  = aws_lb_target_group.lb_target_group.arn_suffix
    LoadBalancer = aws_lb.pb_proj_lb.arn_suffix
  }
actions_enabled = true
alarm_actions = [aws_autoscaling_policy.scale_up_policy.arn]
}
####################################################################
resource "aws_autoscaling_policy" "scale_down_policy" {
name = "scaledown"
autoscaling_group_name = aws_autoscaling_group.pb_asg.name
adjustment_type = "ChangeInCapacity"
scaling_adjustment = "-1"
cooldown = "60"
policy_type = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
alarm_name = "scaleDownAlarm"
alarm_description = "alarm for the scale down"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "RequestCount"
namespace = "AWS/ApplicationELB"
period = "60"
statistic = "Average"
threshold = "10"
dimensions = {
    TargetGroup  = aws_lb_target_group.lb_target_group.arn_suffix
    LoadBalancer = aws_lb.pb_proj_lb.arn_suffix
  }
actions_enabled = true
alarm_actions = [aws_autoscaling_policy.scale_down_policy.arn]
}

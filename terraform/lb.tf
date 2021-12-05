resource "aws_lb_target_group" "lb_target_group" {
  name     = "lbphonebookbapp"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_pb.id
}
resource "aws_lb" "pb_proj_lb" {
  name               = "lbphonebook"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_pb.id,aws_security_group.serversecurity.id]
  subnets            = [aws_subnet.lbsub1.id, aws_subnet.lbsub2.id]

  enable_deletion_protection = false
  tags = {
      Name = "phonebooklb"
      Environment = "production"
  }
}


resource "aws_lb_listener" "pb_listener" {
  load_balancer_arn = aws_lb.pb_proj_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

    

    fixed_response {
      content_type = "text/plain"
      message_body = "There s nothing here"
      status_code = "200"
    }
    
  }
}

resource "aws_lb_listener_rule" "listener_rule" {
 listener_arn = aws_lb_listener.pb_listener.arn

 action {
   type  = "forward"
   target_group_arn = aws_lb_target_group.lb_target_group.arn
 }

 condition {
   host_header {
       values = ["mypb.contacts.com"]
   }
 }
}



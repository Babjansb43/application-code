# Target group for application load balancer
resource "aws_lb_target_group" "targetgroup" {
  health_check {
    interval            = 5
    path                = "/"
    protocol            = "HTTP"
    timeout             = 2
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  stickiness {
    type    = "lb_cookie"
    enabled = true
  }

  name        = "targetgroup"
  port        = 8080
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpc.id
}

# Load Balancer Target Group attachment for first instance
resource "aws_lb_target_group_attachment" "myec2vm1tg1" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = aws_instance.tomcat.id
  port             = 8080
}


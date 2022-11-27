
# security group for load balancer

resource "aws_security_group" "alb-sg" {
  description = "security group for load balancer"
  vpc_id      = aws_vpc.vpc-3T.id


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-security-group"
  }
}




# Load balancer

resource "aws_alb" "alb" {
  name               = "alb"
  internal           = true
  subnets            = [aws_subnet.pub-sub1.id, aws_subnet.pub-sub2.id, aws_subnet.pub-sub3.id]
  security_groups    = [aws_security_group.alb-sg.id]
  load_balancer_type = "application"


}

# Create an application load balancer listener 
# The listener is configured to accept HTTP client connections.

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.target-grp.arn
    type             = "forward"
  }
}


# listener rule
resource "aws_alb_listener_rule" "listener-rule" {
  depends_on = [
    aws_alb_target_group.target-grp
  ]
  listener_arn = aws_alb_listener.alb-listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.target-grp.id
  }

  condition {
    path_pattern {
      values = ["/static/*"]
    }
  }
}

############################################
# create a target group-1

resource "aws_alb_target_group" "target-grp" {
  name     = "webtier"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-3T.id
  #target_type = "instance"

  load_balancing_algorithm_type = "least_outstanding_requests"

  stickiness {
    enabled         = true
    type            = "lb_cookie"
    cookie_duration = 1800
  }

  health_check {
    enabled             = true
    healthy_threshold   = 4
    unhealthy_threshold = 10
    interval            = 30
    timeout             = 20
    protocol            = "HTTP"

  }

  #depends_on = [
  #   aws_lb.alb
  #]


}

##########################################




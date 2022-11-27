resource "aws_launch_template" "alpha1" {
  name_prefix   = "alpha"
  instance_type = var.instance_type
  image_id      = var.amazon_linux
  key_name      = var.key_name
  user_data     = filebase64("${"install_apache.sh"}")

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.freebird-sg.id]
  }
  #  tags = {
  #   Name = var.lauch_template-1
  # }
}
############

resource "aws_autoscaling_group" "webtier-asg" {

  # availability_zones        = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  desired_capacity          = 4
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 30
  health_check_type         = "ELB"
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.pub-sub1.id, aws_subnet.pub-sub2.id, aws_subnet.pub-sub3.id]

  # instructs terraform to create the new version before destroying  the original to avoid any service interruptions
  launch_template {
    id      = aws_launch_template.alpha1.id
    version = "$Latest"
  }
  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}

# create a new ALB Target group attachment
resource "aws_autoscaling_attachment" "webtier-asg" {
  autoscaling_group_name = aws_autoscaling_group.webtier-asg.id
  alb_target_group_arn   = aws_alb_target_group.target-grp.arn
  #lb_target_group_arn    = aws_lb_target_group.alb-target-group.arn
  #elb                    = aws_elb.test.id
}


##########################

/* resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-1a2b3c"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
} */
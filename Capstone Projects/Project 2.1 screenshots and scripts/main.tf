resource "aws_launch_configuration" "dannie_lc" {
  name          = "dannie-launch-configuration"
  image_id      = "ami-0443d29a4bc22b3a5"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}
// Create Autoscaling group
resource "aws_autoscaling_group" "dannie_asg" {
  launch_configuration = aws_launch_configuration.dannie_lc.name
  min_size             = 1
  max_size             = 1
  desired_capacity     = 1
  vpc_zone_identifier  = [aws_subnet.dannie-public-subnet-1.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb" "dannie_alb" {
  name               = "dannie-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dannie-vpc-sg.id]
  subnets            = [aws_subnet.dannie-public-subnet-1.id, aws_subnet.dannie-public-subnet-2.id] // Include both subnets

  enable_deletion_protection = true
}
// Create target group

resource "aws_lb_target_group" "dannie_tg" {
  name     = "dannie-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.dannie-vpc.id

  health_check {
    enabled             = true
    path                = "/"
    timeout             = 3
    interval            = 30
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "dannie_listener" {
  load_balancer_arn = aws_lb.dannie_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dannie_tg.arn
  }
}

resource "aws_route53_zone" "daniel_zone" {
  name = "daniel.com."
}

resource "aws_route53_record" "dannie_alias" {
  zone_id = aws_route53_zone.daniel_zone.id
  name    = "www.daniel.com"
  type    = "A"

  alias {
    name                   = aws_lb.dannie_alb.dns_name
    zone_id                = aws_lb.dannie_alb.zone_id
    evaluate_target_health = true
  }
}


// Create Cloudwatch

resource "aws_cloudwatch_metric_alarm" "dannie_alarm" {
  alarm_name          = "dannie-cpu-usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "CPU usage exceeds 80%"
  alarm_actions       = ["arn:aws:sns:eu-west-2:123456789012:MyTopic"]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.dannie_asg.name
  }
}

// Create Autoscaling
resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.dannie_asg.name
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.dannie_asg.name
  policy_type            = "SimpleScaling"
}

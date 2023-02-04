resource "aws_lb_target_group" "target-group" {
  health_check {
    interval = 10
    path = "/"
    protocol = "HTTP"
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
  }

  name = "whiz-tg"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_lb" "publicalb" {
  name               = "public-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  security_groups = [aws_security_group.web-server.id]
  subnets = data.aws_subnets.subnet.ids
  tags = {
    Name = "public-alb"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.publicalb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.target-group.arn
    type = "forward"
  }
}

resource "aws_lb_target_group_attachment" "ec2-attach" {
    count = length(aws_instance.app_server)
    target_group_arn = aws_lb_target_group.target-group.arn
    target_id = aws_instance.app_server[count.index].id 
}